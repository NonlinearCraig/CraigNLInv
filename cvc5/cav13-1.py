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
    two_int = slv.mkInteger(2)
    x1_power = slv.mkTerm(Kind.POW, x1, two_int)
    x2_power = slv.mkTerm(Kind.POW, x2, two_int)
    power_sum = slv.mkTerm(Kind.ADD, x1_power, x2_power)

    # pre:1-x1^2-x2^2
    pre1 = slv.mkTerm(Kind.SUB, one, power_sum)
    pre = slv.mkTerm(Kind.GEQ, pre1, zero)
    #loop:3-x1^2-x2^2
    loop1 = slv.mkTerm(Kind.SUB, three, power_sum)


    # y1=x1^2+x2-1
    y1_loop = slv.mkTerm(Kind.ADD, x1_power, slv.mkTerm(Kind.SUB, x2, one))
    #y2=(x1^2+x2-1)x2+1+x2
    y2_loop = slv.mkTerm(Kind.ADD,(slv.mkTerm(Kind.ADD, slv.mkTerm(Kind.MULT, y1_loop, x2), one)), x2)

    ite = slv.mkTerm(Kind.ITE,
                     slv.mkTerm(Kind.GEQ, loop1, zero),
                     slv.mkTerm(Kind.AND, slv.mkTerm(Kind.EQUAL, y1, y1_loop), slv.mkTerm(Kind.EQUAL, y2, y2_loop)),
                     slv.mkTerm(Kind.AND, slv.mkTerm(Kind.EQUAL, y1, x1), slv.mkTerm(Kind.EQUAL, y2, x2)))

    # define the pre-conditions, transition relations, and post-conditions

    # pre_f pre>=0;
    pre_f = slv.defineFun("pre-f", [x1, x2], boolean, pre)

    # trans_f: if-then-else
    trans_f = slv.defineFun("trans-f", [x1, x2, y1, y2], boolean, ite)

    #post:1-0.2*x1^2+x2>=0

    post1 = slv.mkTerm(Kind.SUB, one, slv.mkTerm(Kind.MULT, slv.mkTerm(0.2), x1_power))
    # 1-0.2*x1^2
    post2 = slv.mkTerm(Kind.ADD, x2, post1)
    # 1-0.2*x1^2+x2>=0
    post = slv.mkTerm(Kind.GEQ, post2, zero)

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

#time out >3600s