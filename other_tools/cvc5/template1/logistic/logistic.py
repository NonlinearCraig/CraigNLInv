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

    # pre:x*(1-x)>=0
    pre1 = slv.mkTerm(Kind.SUB, slv.mkReal(1), x)
    pre = slv.mkTerm(Kind.MULT,x, pre1)
    pre= slv.mkTerm(Kind.GEQ, pre, zero)

    # x_p=-1.6*x*(1-x)
    x_1=slv.mkTerm(Kind.MULT, slv.mkReal(-1.6), x)
    x_p=slv.mkTerm(Kind.MULT, x_1, slv.mkTerm(Kind.SUB,slv.mkReal(1),x))
    loop=slv.mkTerm(Kind.EQUAL, y,x_p)

    #loop_cond: (x+0.3)*(1.7-x)>=0
    loop1=slv.mkTerm(Kind.MULT,slv.mkTerm(Kind.ADD,x,slv.mkReal(0.3)),slv.mkTerm(Kind.SUB,slv.mkReal(1.7),x))
    loop_cond=slv.mkTerm(Kind.GEQ,loop1,zero)

    # post (x-1.5)*(x+1)<=0
    post1 = slv.mkTerm(Kind.MULT, slv.mkTerm(Kind.ADD, x, slv.mkReal(1)), slv.mkTerm(Kind.SUB, x, slv.mkReal(1.5)))
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