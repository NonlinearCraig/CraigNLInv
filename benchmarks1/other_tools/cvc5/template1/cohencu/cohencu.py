from z3 import *
import time
from token import EQUAL
import cvc5
import utils
from cvc5 import Kind
import time

if __name__ == "__main__":
    start = time.time()
    slv = cvc5.Solver()

    # required options
    slv.setOption("sygus", "true")
    slv.setOption("incremental", "false")

    # set the logic
    slv.setLogic("ALL")

    real = slv.getRealSort()
    boolean = slv.getBooleanSort()

    zero = slv.mkReal(0)
    one = slv.mkReal(1)
    four = slv.mkReal(4)
    three = slv.mkReal(3)

    # declare input variables for functions
    x1 = slv.mkVar(real, "x1")
    x2 = slv.mkVar(real, "x2")
    y1 = slv.mkVar(real, "y1")
    y2 = slv.mkVar(real, "y2")

    x1_pow = slv.mkTerm(Kind.POW, x1, slv.mkReal(2))
    # pre x1=0 && x2=0
    pre = slv.mkTerm(Kind.AND, slv.mkTerm(Kind.EQUAL, x1, slv.mkReal(0)), slv.mkTerm(Kind.EQUAL, x2, slv.mkReal(0)))

    # post 2.5*x1^2+4*x1-x2<=0 && x2-3.5*x1^2-3*x1<=0
    # post1=2.5*x1^2+4*x1-x2<=0
    post1 = slv.mkTerm(Kind.ADD, slv.mkTerm(Kind.MULT, slv.mkReal(2.5), x1_pow),
                       slv.mkTerm(Kind.MULT, slv.mkReal(4), x1))
    post1 = slv.mkTerm(Kind.LEQ, slv.mkTerm(Kind.SUB, post1, x2), slv.mkReal(0))
    # post2=x2-3.5*x1^2-3*x1<=0
    post2 = slv.mkTerm(Kind.SUB, x2, slv.mkTerm(Kind.MULT, slv.mkReal(3.5), x1_pow))
    post2 = slv.mkTerm(Kind.LEQ, slv.mkTerm(Kind.SUB, post2, slv.mkTerm(Kind.MULT,slv.mkReal(3), x1)), slv.mkReal(0))

    post = slv.mkTerm(Kind.AND, post1, post2)

    # loop_condition:
    # loop: 5-x1>=0 &&x1*(10-x1)>=0&&x2*(10-x2)>=0
    loop1 = slv.mkTerm(Kind.GEQ, slv.mkTerm(Kind.SUB, slv.mkReal(5), x1), slv.mkReal(0))
    loop2 = slv.mkTerm(Kind.GEQ, slv.mkTerm(Kind.MULT, x1, slv.mkTerm(Kind.SUB, slv.mkReal(10), x1)), slv.mkReal(0))
    loop3 = slv.mkTerm(Kind.GEQ, slv.mkTerm(Kind.MULT, x2, slv.mkTerm(Kind.SUB, slv.mkReal(10), x2)), slv.mkReal(0))
    loop_cond = slv.mkTerm(Kind.AND, loop1, slv.mkTerm(Kind.AND, loop2, loop3))

    # loop:y1=x1 + 1, y2=x2 + 5.5*x1 + 5.5
    x1_p = slv.mkTerm(Kind.ADD, x1, slv.mkReal(1))

    x2_p = slv.mkTerm(Kind.ADD, slv.mkTerm(Kind.MULT, x1, slv.mkReal(5.5)), x2)
    x2_p = slv.mkTerm(Kind.ADD, x2_p, slv.mkReal(5.5))

    ite = slv.mkTerm(Kind.ITE,
                     loop_cond,
                     slv.mkTerm(Kind.AND, slv.mkTerm(Kind.EQUAL, y1, x1_p), slv.mkTerm(Kind.EQUAL, y2, x2_p)),
                     slv.mkTerm(Kind.AND, slv.mkTerm(Kind.EQUAL, y1, x1), slv.mkTerm(Kind.EQUAL, y2, x2)))

    # define the pre-conditions, transition relations, and post-conditions

    # pre_f pre>=0;
    pre_f = slv.defineFun("pre-f", [x1, x2], boolean, pre)

    # trans_f: if-then-else
    trans_f = slv.defineFun("trans-f", [x1, x2, y1, y2], boolean, ite)

    post_f = slv.defineFun("post-f", [x1, x2], boolean, post)

    inv_f = slv.synthFun("inv-f", [x1, x2], boolean)
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
    end = time.time()
    print("Consuming Time: %.8f s\n" % ((end - start)))

# no solution