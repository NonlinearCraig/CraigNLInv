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

    zero = slv.mkReal(0)
    one=slv.mkReal(1)
    minus_one=slv.mkReal(-1)

    # declare input variables for functions
    x = slv.mkVar(real, "x")
    y = slv.mkVar(real, "y")

    #pre1=(x+1)*(3-x)>=0
    pre1 = slv.mkTerm(Kind.MULT, slv.mkTerm(Kind.ADD,x,one), slv.mkTerm(Kind.SUB,slv.mkReal(3),x))
    pre = slv.mkTerm(Kind.GEQ, pre1, zero)

    two=slv.mkReal(2)
    four=slv.mkReal(4)

    # x_p=x-0.01*x1*(x-2)*(x-4)
    zero_zero_one=slv.mkReal(0.01)
    x_loop=slv.mkTerm(Kind.MULT,slv.mkTerm(Kind.SUB,x,two),slv.mkTerm(Kind.SUB,x,four))
    x_loop=slv.mkTerm(Kind.MULT,x_loop,x)
    x_loop = slv.mkTerm(Kind.MULT, x_loop, zero_zero_one)
    x_loop=slv.mkTerm(Kind.SUB,x,x_loop)

    #loop_cond: (x+2)*(x-3.5)<=0

    loop1=slv.mkTerm(Kind.MULT,slv.mkTerm(Kind.ADD,x,slv.mkReal(2)),slv.mkTerm(Kind.SUB,x,slv.mkReal(3.5)))
    loop=slv.mkTerm(Kind.LEQ,loop1,zero)

    ite = slv.mkTerm(Kind.ITE,
                      loop,
                      slv.mkTerm(Kind.EQUAL, y, x_loop),
                      slv.mkTerm(Kind.EQUAL, y, x))

    # define the pre-conditions, transition relations, and post-conditions

    #pre_f pre>=0;
    pre_f = slv.defineFun("pre-f", [x], boolean,pre)

    #trans_f: if-then-else
    trans_f = slv.defineFun("trans-f", [x, y], boolean, ite)

    #post (x-3)*(5-x)>=0
    three=slv.mkReal(3)
    five=slv.mkReal(5)

    post1=slv.mkTerm(Kind.MULT,slv.mkTerm(Kind.ADD,x,three),slv.mkTerm(Kind.SUB,five,x))
    pos=slv.mkTerm(Kind.GEQ, post1, zero)

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
# (
#   (define-fun inv-f ((x Real)) Bool (>= (+ x (* (/ (- 1) 2) (* x x))) (/ (- 15) 2)))
# )
# Consuming Time: 0.96005583 s