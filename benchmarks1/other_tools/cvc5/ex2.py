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
    two = slv.mkInteger(2)
    # declare input variables for functions
    x1 = slv.mkVar(real, "x1")
    x2=slv.mkVar(real, "x2")
    y1 = slv.mkVar(real, "y1")
    y2 = slv.mkVar(real, "y2")

    #pre:x1 ** 2 + x2 ** 2 - 1 <= 0
    pre1 = slv.mkTerm(Kind.ADD, slv.mkTerm(Kind.POW,x1,two), slv.mkTerm(Kind.POW,x2,two))
    pre1=slv.mkTerm(Kind.SUB,pre1,one)
    pre = slv.mkTerm(Kind.LEQ, pre1, zero)


    # loop: y1=0.9 * (x1 - 0.01 * x2) y2=0.9 * (x2 + 0.01 * x1)
    y1_loop=slv.mkTerm(Kind.MULT,slv.mkReal(0.9),slv.mkTerm(Kind.SUB,x1,slv.mkTerm(Kind.MULT,x2,slv.mkReal(0.01))))
    y2_loop=slv.mkTerm(Kind.MULT,slv.mkReal(0.9),slv.mkTerm(Kind.ADD,x2,slv.mkTerm(Kind.MULT,x1,slv.mkReal(0.01))))
    loop=slv.mkTerm(Kind.AND,slv.mkTerm(Kind.EQUAL, y1, y1_loop),slv.mkTerm(Kind.EQUAL, y2, y2_loop))

    #loop_cond x1**2+x2**2-1<=0
    loop_cond = slv.mkTerm(Kind.ADD, slv.mkTerm(Kind.POW, x1, two), slv.mkTerm(Kind.POW, x2, two))
    loop_cond = slv.mkTerm(Kind.SUB, loop_cond, one)
    loop_cond = slv.mkTerm(Kind.LEQ, loop_cond, zero)

    # post = 0.25- x1 ** 2 - (x2 - 2) ** 2 <= 0
    post1 = slv.mkTerm(Kind.SUB, slv.mkReal(1.1), slv.mkTerm(Kind.POW, x1, two))
    post1 = slv.mkTerm(Kind.SUB, post1, slv.mkTerm(Kind.POW, slv.mkTerm(Kind.SUB, x2, two), two))
    post = slv.mkTerm(Kind.LEQ, post1, zero)

    ite = slv.mkTerm(Kind.ITE,
                      loop_cond,
                      loop,
                      slv.mkTerm(Kind.AND,slv.mkTerm(Kind.EQUAL,y1,x1), slv.mkTerm(Kind.EQUAL,y2,x2)))

    # define the pre-conditions, transition relations, and post-conditions

    #pre_f;
    pre_f = slv.defineFun("pre-f", [x1,x2], boolean,pre)

    #trans_f: if-then-else
    trans_f = slv.defineFun("trans-f", [x1,x2, y1,y2], boolean, ite)

    #post_f
    post_f = slv.defineFun("post-f", [x1,x2], boolean, post)

    #inv_f
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


#no solution
#Consuming Time: 0.07441092 s