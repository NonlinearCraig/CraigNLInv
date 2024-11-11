import cvc5
import utils
from cvc5 import Kind
import time
if __name__ == "__main__":
    start=time.time()
    slv = cvc5.Solver()

    # required options
    slv.setOption("sygus", "true")
    slv.setOption("incremental", "false")

    # set the logic
    slv.setLogic("ALL")

    real = slv.getRealSort()
    boolean = slv.getBooleanSort()

    zero=slv.mkReal(0)
    # declare input variables for functions
    x = slv.mkVar(real, "x")
    y = slv.mkVar(real, "y")

    # pre:x*(80-x)>=0
    pre1 = slv.mkTerm(Kind.SUB, slv.mkReal(80), x)
    pre = slv.mkTerm(Kind.MULT,x, pre1)
    pre= slv.mkTerm(Kind.GEQ, pre, zero)

    # x_p=0.005*(1000-0.5418*X^2)
    two=slv.mkInteger(2)
    x_power=slv.mkTerm(Kind.MULT, slv.mkReal(0.5418), slv.mkTerm(Kind.POW, x, two))
    x_power_mul_sub=slv.mkTerm(Kind.SUB, slv.mkReal(1000), x_power)
    x_p=slv.mkTerm(Kind.MULT, slv.mkReal(0.0005), x_power_mul_sub)
    loop=slv.mkTerm(Kind.EQUAL, y, slv.mkTerm(Kind.ADD, x, x_p))

    #loop_cond: (x+1)(x-82)<=0
    loop1=slv.mkTerm(Kind.MULT,slv.mkTerm(Kind.ADD,x,slv.mkReal(1)),slv.mkTerm(Kind.SUB,x,slv.mkReal(82)))
    loop_cond=slv.mkTerm(Kind.LEQ,loop1,zero)

    # post (x+10)(x-79)<=0
    post1 = slv.mkTerm(Kind.MULT, slv.mkTerm(Kind.ADD, x, slv.mkReal(10)), slv.mkTerm(Kind.SUB, x, slv.mkReal(79)))
    pos = slv.mkTerm(Kind.LEQ, post1, zero)


    ite = slv.mkTerm(Kind.ITE,
                      loop_cond,
                      loop,
                      slv.mkTerm(Kind.EQUAL, y, x))

    # define the pre-conditions, transition relations, and post-conditions

    #pre_f pre>=0;
    pre_f = slv.defineFun("pre-f", [x], boolean, pre)
    #trans_f: if-then-else
    trans_f = slv.defineFun("trans-f", [x, y], boolean, ite)
    post_f = slv.defineFun("post-f", [x], boolean, pos)
    inv_f = slv.synthFun("inv-f", [x], boolean)
    # declare the invariant-to-synthesize

    slv.addSygusInvConstraint(inv_f, pre_f, trans_f, post_f)

     # print solutions if available
    if slv.checkSynth().hasSolution():
        # Output should be equivalent to:
        # (define-fun inv-f ((x Int)) Bool (not (>= x 11)))
        terms = [inv_f]
        utils.print_synth_solutions(terms, slv.getSynthSolutions(terms))
    else:
        print("no solution")
    end=time.time()
    print("Consuming Time: %.8f s\n" % ((end - start)))

#no solution