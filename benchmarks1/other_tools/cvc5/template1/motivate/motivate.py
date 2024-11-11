# ex2 time out
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
    two_int = slv.mkInteger(2)


    # declare input variables for functions
    x1 = slv.mkVar(real, "x1")
    x2 = slv.mkVar(real, "x2")
    x3=  slv.mkVar(real, "x3")
    y1 = slv.mkVar(real, "y1")
    y2 = slv.mkVar(real, "y2")
    y3 = slv.mkVar(real, "y3")

    x1_power = slv.mkTerm(Kind.POW, slv.mkTerm(Kind.SUB,x1,slv.mkReal(3)), two_int)
    x2_power = slv.mkTerm(Kind.POW, x2, two_int)
    x3_power = slv.mkTerm(Kind.POW, slv.mkTerm(Kind.SUB,x3,slv.mkReal(3)), two_int)
    power_sum = slv.mkTerm(Kind.ADD, x1_power, x2_power,x3_power)


    # pre : -(x1 - 3) ^ 2 - x2 ^ 2 - (x3 - 3) ^ 2 + 0.25>=0

    pre1 = slv.mkTerm(Kind.SUB, slv.mkReal(0.25), power_sum)
    pre = slv.mkTerm(Kind.GEQ, pre1, zero)


    #loop:-(x1-3)^2 - x2^2 - (x3-3)^2 + 2
    loop1 = slv.mkTerm(Kind.SUB, slv.mkReal(2), power_sum)
    loop = slv.mkTerm(Kind.GEQ, pre1, zero)



    # y1=(2*x1 + x2)*0.1+x1

    y1_loop = slv.mkTerm(Kind.ADD, x1,slv.mkTerm(Kind.MULT,slv.mkReal(0.1),slv.mkTerm(Kind.ADD,x2,x1,x1)))

    # y2= (x1+9*x2+1/2*x3)*0.1+x2;
    y21=slv.mkTerm(Kind.ADD,x1,slv.mkTerm(Kind.MULT,slv.mkReal(9),x2),slv.mkTerm(Kind.MULT,slv.mkReal(0.5),x3))
    y2_loop = slv.mkTerm(Kind.ADD, x2,slv.mkTerm(Kind.MULT,slv.mkReal(0.1),y21))

    #y3= (2*x2+16*x3)*0.1+x3;
    y31=slv.mkTerm(Kind.ADD,slv.mkTerm(Kind.MULT,slv.mkInteger(2),x2),slv.mkTerm(Kind.MULT,slv.mkReal(16),x3))
    y3_loop = slv.mkTerm(Kind.ADD, x2, slv.mkTerm(Kind.MULT, slv.mkReal(0.1), y31))

    ite = slv.mkTerm(Kind.ITE,
                     slv.mkTerm(Kind.GEQ, loop1, zero),
                     slv.mkTerm(Kind.AND, slv.mkTerm(Kind.EQUAL, y1, y1_loop), slv.mkTerm(Kind.EQUAL, y2, y2_loop),slv.mkTerm(Kind.EQUAL, y3, y3_loop)),
                     slv.mkTerm(Kind.AND, slv.mkTerm(Kind.EQUAL, y1, x1), slv.mkTerm(Kind.EQUAL, y2, x2),slv.mkTerm(Kind.EQUAL, y3, x3)))

    # define the pre-conditions, transition relations, and post-conditions

    # pre_f pre>=0;
    pre_f = slv.defineFun("pre-f", [x1, x2,x3], boolean, pre)

    # trans_f: if-then-else
    trans_f = slv.defineFun("trans-f", [x1, x2, x3, y1, y2, y3], boolean, ite)




    # post : x3 - 0.5*x2^2 - 1>=0

    post = slv.mkTerm(Kind.GEQ,slv.mkTerm(Kind.ADD,x3,slv.mkTerm(Kind.MULT,slv.mkReal(-0.5),x2_power),slv.mkReal(-1)),zero)

    post_f = slv.defineFun("post-f", [x1, x2,x3], boolean, post)
    inv_f = slv.synthFun("inv-f", [x1, x2,x3], boolean)
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
# Consuming Time: 0.00494528 s
