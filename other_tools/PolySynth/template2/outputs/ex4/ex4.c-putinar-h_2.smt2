(set-option :produce-models true); benchmark generated from python API
(set-info :status unknown)
(declare-fun l_0_0_4 () Real)
(declare-fun l_0_0_1 () Real)
(declare-fun _a_0_ () Real)
(declare-fun l_0_0_5 () Real)
(declare-fun l_0_0_2 () Real)
(declare-fun _a_1_ () Real)
(declare-fun l_0_0_6 () Real)
(declare-fun l_0_0_3 () Real)
(declare-fun l_0_1_8 () Real)
(declare-fun l_0_1_7 () Real)
(declare-fun l_0_1_5 () Real)
(declare-fun l_0_1_4 () Real)
(declare-fun l_0_1_1 () Real)
(declare-fun l_0_1_2 () Real)
(declare-fun l_0_1_9 () Real)
(declare-fun l_0_1_6 () Real)
(declare-fun l_0_1_3 () Real)
(declare-fun l_0_2_1 () Real)
(declare-fun l_0_2_3 () Real)
(declare-fun l_0_2_4 () Real)
(declare-fun l_0_2_6 () Real)
(declare-fun l_0_2_7 () Real)
(declare-fun l_0_2_9 () Real)
(assert
 (let ((?x35 (* l_0_0_4 l_0_0_4)))
 (= (- (- _a_0_ (* (* 1.0 l_0_0_1) l_0_0_1)) ?x35) 0.0)))
(assert
 (let ((?x71 (- (- _a_1_ (* (* 2.0 l_0_0_1) l_0_0_2)) (* (* 2.0 l_0_0_4) l_0_0_5))))
 (= ?x71 0.0)))
(assert
 (let ((?x95 (* l_0_0_6 l_0_0_6)))
 (let ((?x93 (* l_0_0_5 l_0_0_5)))
 (let ((?x92 (- (- (* l_0_0_1 l_0_0_1) (* (* 1.0 l_0_0_2) l_0_0_2)) (* (* 1.0 l_0_0_3) l_0_0_3))))
 (= (- (- (- ?x92 ?x93) ?x95) 1.0) 0.0)))))
(assert
 (let ((?x67 (* (* 2.0 l_0_0_1) l_0_0_2)))
 (= ?x67 0.0)))
(assert
 (= (+ (* l_0_0_2 l_0_0_2) (* l_0_0_3 l_0_0_3)) 0.0))
(assert
 (>= l_0_0_1 0.0))
(assert
 (>= l_0_0_3 0.0))
(assert
 (>= l_0_0_4 0.0))
(assert
 (>= l_0_0_6 0.0))
(assert
 (let ((?x129 (- (* (* (* (- 2.0) _a_0_) l_0_1_1) l_0_1_2) (* (* _a_1_ l_0_1_1) l_0_1_1))))
 (let ((?x136 (- (+ ?x129 (* (* 18.0 l_0_1_4) l_0_1_5)) (* (* 2.0 l_0_1_7) l_0_1_8))))
 (= (+ ?x136 8.0) 0.0))))
(assert
 (let ((?x182 (* l_0_1_9 l_0_1_9)))
 (let ((?x180 (* l_0_1_8 l_0_1_8)))
 (let ((?x177 (* l_0_1_6 l_0_1_6)))
 (let ((?x178 (* 9.0 ?x177)))
 (let ((?x173 (* l_0_1_5 l_0_1_5)))
 (let ((?x175 (* 9.0 ?x173)))
 (let ((?x171 (* l_0_1_4 l_0_1_4)))
 (let ((?x169 (* l_0_1_1 l_0_1_1)))
 (let ((?x168 (- (* (- _a_0_) (+ (* l_0_1_2 l_0_1_2) (* l_0_1_3 l_0_1_3))) (* (* (* 2.0 _a_1_) l_0_1_1) l_0_1_2))))
 (let ((?x184 (- (- (- (+ (+ (- (+ ?x168 ?x169) ?x171) ?x175) ?x178) ?x180) ?x182) 1.0)))
 (= ?x184 0.0))))))))))))
(assert
 (let ((?x216 (* l_0_1_7 l_0_1_7)))
 (let ((?x171 (* l_0_1_4 l_0_1_4)))
 (let ((?x214 (* 9.0 ?x171)))
 (= (- (- (+ (* (* (- _a_0_) l_0_1_1) l_0_1_1) ?x214) ?x216) 15.0) 0.0)))))
(assert
 (let ((?x236 (+ (* (- _a_1_) (+ (* l_0_1_2 l_0_1_2) (* l_0_1_3 l_0_1_3))) (* (* 2.0 l_0_1_1) l_0_1_2))))
 (= (- ?x236 (* (* 2.0 l_0_1_4) l_0_1_5)) 0.0)))
(assert
 (let ((?x177 (* l_0_1_6 l_0_1_6)))
 (let ((?x173 (* l_0_1_5 l_0_1_5)))
 (let ((?x162 (* l_0_1_3 l_0_1_3)))
 (let ((?x161 (* l_0_1_2 l_0_1_2)))
 (let ((?x163 (+ ?x161 ?x162)))
 (= (- (- ?x163 ?x173) ?x177) 0.0)))))))
(assert
 (>= l_0_1_1 0.0))
(assert
 (>= l_0_1_3 0.0))
(assert
 (>= l_0_1_4 0.0))
(assert
 (>= l_0_1_6 0.0))
(assert
 (>= l_0_1_7 0.0))
(assert
 (>= l_0_1_9 0.0))
(assert
 false)
(assert
 (>= l_0_2_1 0.0))
(assert
 (>= l_0_2_3 0.0))
(assert
 (>= l_0_2_4 0.0))
(assert
 (>= l_0_2_6 0.0))
(assert
 (>= l_0_2_7 0.0))
(assert
 (>= l_0_2_9 0.0))
(check-sat)
(get-model)