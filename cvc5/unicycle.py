# unicycle timeout
from z3 import *
import time

import cvc5
import utils


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
    x2_power = slv.mkTerm(Kind.POW, slv.mkTerm(Kind.SUB,x2,one), two_int)
    power_sum = slv.mkTerm(Kind.ADD, x1_power, x2_power)

    #pre
    pre = slv.mkTerm(Kind.SUB,power_sum,one)
    #post
    post=slv.mkTerm(Kind.SUB,power_sum,four)



    #loop:
    one_o_one = slv.mkReal(1.0718)
    zero_o_zero_two = slv.mkReal(0.0253)
    one_o_eight = slv.mkReal(1.8721)

    # w=1.0178 + 1.8721 * x1 - 0.0253 * x2
    one_o_x1 = slv.mkTerm(Kind.MULT, one_o_eight, x1)
    zero_o_x2 = slv.mkTerm(Kind.MULT, zero_o_zero_two, x2)
    w = slv.mkTerm(Kind.ADD, one_o_one, slv.mkTerm(Kind.SUB, one_o_x1, zero_o_x2))

    # 0.01*(1-x2*w)
    zero_zero_one = slv.mkReal(0.01)
    x1_f = slv.mkTerm(Kind.ADD,
                      slv.mkTerm(Kind.MULT, zero_zero_one, slv.mkTerm(Kind.SUB, one, slv.mkTerm(Kind.MULT, x2, w))), x1)
    x2_f = slv.mkTerm(Kind.ADD, x2, slv.mkTerm(Kind.MULT, zero_zero_one, slv.mkTerm(Kind.MULT, x1, w)))




    ite = slv.mkTerm(Kind.ITE,
                     slv.mkTerm(Kind.GEQ, one, zero),
                     slv.mkTerm(Kind.AND, slv.mkTerm(Kind.EQUAL, y1, x1_f), slv.mkTerm(Kind.EQUAL, y2, x2_f)),
                     slv.mkTerm(Kind.AND, slv.mkTerm(Kind.EQUAL, y1, x1), slv.mkTerm(Kind.EQUAL, y2, x2)))

    # define the pre-conditions, transition relations, and post-conditions

    # pre_f pre>=0;
    pre_f = slv.defineFun("pre-f", [x1, x2], boolean, slv.mkTerm(Kind.LEQ,pre,zero))

    # trans_f: if-then-else
    trans_f = slv.defineFun("trans-f", [x1, x2, y1, y2], boolean, ite)


    post_f = slv.defineFun("post-f", [x1, x2], boolean, slv.mkTerm(Kind.LEQ,post,zero))

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

#time out> 3600s
