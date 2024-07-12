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
    x1 = slv.mkVar(real, "x1")
    x2=slv.mkVar(real, "x1")
    y1 = slv.mkVar(real, "y1")
    y2 = slv.mkVar(real, "y1")


    #pre:(x1 - 0.5) ** 2 + (x2 - 0.5) ** 2 - 0.25 ** 2 <= 0
    two = slv.mkReal(2)
    zero_five = slv.mkReal(0.5)
    pre1 = slv.mkTerm(Kind.ADD, slv.mkTerm(Kind.POW,slv.mkTerm(Kind.SUB,x1,zero_five),two), slv.mkTerm(Kind.POW,slv.mkTerm(Kind.SUB,x2,zero_five),two))
    zero_zero_six_two_five=slv.mkReal(0.0625)
    pre = slv.mkTerm(Kind.LEQ, pre1, zero_zero_six_two_five)


    # loop: y1=x1*8/9-x2*1/18 y2=0.1*x1+0.9*x2
    four = slv.mkReal(4)
    y1_loop=slv.mkTerm(Kind.SUB,slv.mkTerm(Kind.MULT,x1,slv.mkReal(8/9)),slv.mkTerm(Kind.MULT,x2,slv.mkReal(1/18)))
    y2_loop=slv.mkTerm(Kind.ADD,slv.mkTerm(Kind.MULT,x1,slv.mkReal(0.1)),slv.mkTerm(Kind.MULT,x2,slv.mkReal(0.9)))
    loop=slv.mkTerm(Kind.AND,slv.mkTerm(Kind.EQUAL, y1, y1_loop),slv.mkTerm(Kind.EQUAL, y2, y2_loop))

    #loop_cond
    loop_cond=slv.mkTerm(Kind.LEQ,slv.mkReal((-1)),one)

    ite = slv.mkTerm(Kind.ITE,
                      loop_cond,
                      loop,
                      slv.mkTerm(Kind.AND,slv.mkTerm(Kind.EQUAL,y1,x1), slv.mkTerm(Kind.EQUAL,y2,x2)))

    # define the pre-conditions, transition relations, and post-conditions

    #pre_f pre>=0;
    pre_f = slv.defineFun("pre-f", [x1,x2], boolean,pre)

    #trans_f: if-then-else
    trans_f = slv.defineFun("trans-f", [x1,x2, y1,y2], boolean, ite)

    #post x2**2<=4
    post=slv.mkTerm(Kind.LEQ,slv.mkTerm(Kind.POW,x2,two),four)

    post_f = slv.defineFun("post-f", [x1,x2], boolean, post)
    inv_f = slv.synthFun("inv-f", [x1,x2], boolean)
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
#(
#  (define-fun inv-f ((x Real)) Bool (>= (* (- 1) x) (/ (- 4961) 100)))
#)
#Consuming Time: 0.00510240 s