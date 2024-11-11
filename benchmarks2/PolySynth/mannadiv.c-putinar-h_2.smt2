(set-option :produce-models true); benchmark generated from python API
(set-info :status unknown)
(declare-fun l_0_0_3 () Real)
(declare-fun _a_0_ () Real)
(declare-fun l_0_0_1 () Real)
(declare-fun _a_1_ () Real)
(declare-fun l_0_0_2 () Real)
(declare-fun _a_4_ () Real)
(declare-fun l_0_1_3 () Real)
(declare-fun l_0_1_1 () Real)
(declare-fun l_0_1_2 () Real)
(declare-fun _a_2_ () Real)
(declare-fun _a_3_ () Real)
(declare-fun l_0_2_5 () Real)
(declare-fun l_0_2_4 () Real)
(declare-fun l_0_2_3 () Real)
(declare-fun l_0_2_1 () Real)
(declare-fun l_0_2_2 () Real)
(declare-fun l_0_3_5 () Real)
(declare-fun l_0_3_4 () Real)
(declare-fun l_0_3_3 () Real)
(declare-fun l_0_3_1 () Real)
(declare-fun l_0_3_2 () Real)
(assert
 (= (- _a_0_ l_0_0_3) 0.0))
(assert
 (= (- _a_1_ l_0_0_1) 0.0))
(assert
 (= (- _a_4_ l_0_0_2) 0.0))
(assert
 (>= l_0_0_1 0.0))
(assert
 (>= l_0_0_2 0.0))
(assert
 (>= l_0_0_3 0.0))
(assert
 (= (+ (- (* (- _a_0_) l_0_1_1) l_0_1_3) 1.0) 0.0))
(assert
 (= (+ (* (- _a_1_) l_0_1_1) l_0_1_2) 0.0))
(assert
 (= (* (- _a_2_) l_0_1_1) 0.0))
(assert
 (= (* (- _a_3_) l_0_1_1) 0.0))
(assert
 (= (* (- _a_4_) l_0_1_1) 0.0))
(assert
 (>= l_0_1_1 0.0))
(assert
 (>= l_0_1_2 0.0))
(assert
 (>= l_0_1_3 0.0))
(assert
 (let ((?x113 (+ (- (+ (* (- _a_0_) l_0_2_1) _a_0_) (* 1.0 _a_1_)) (* 1.0 _a_3_))))
 (= (- (- (+ ?x113 (* 1.0 l_0_2_3)) (* 1.0 l_0_2_4)) l_0_2_5) 0.0)))
(assert
 (= (- (+ (* (- _a_1_) l_0_2_1) _a_1_) l_0_2_2) 0.0))
(assert
 (= (+ (* (- _a_3_) l_0_2_1) _a_3_) 0.0))
(assert
 (= (+ (- (+ (* (- _a_4_) l_0_2_1) _a_4_) l_0_2_3) l_0_2_4) 0.0))
(assert
 (= (- (+ (* (- _a_2_) l_0_2_1) l_0_2_3) l_0_2_4) 0.0))
(assert
 (>= l_0_2_1 0.0))
(assert
 (>= l_0_2_2 0.0))
(assert
 (>= l_0_2_3 0.0))
(assert
 (>= l_0_2_4 0.0))
(assert
 (>= l_0_2_5 0.0))
(assert
 (let ((?x183 (+ (- (+ (* (- _a_0_) l_0_3_1) _a_0_) (* 1.0 _a_1_)) (* 1.0 _a_2_))))
 (= (- (+ (- ?x183 (* 1.0 l_0_3_3)) (* 1.0 l_0_3_4)) l_0_3_5) 0.0)))
(assert
 (= (- (+ (* (- _a_1_) l_0_3_1) _a_1_) l_0_3_2) 0.0))
(assert
 (= (+ (- (+ (* (- _a_2_) l_0_3_1) _a_2_) l_0_3_3) l_0_3_4) 0.0))
(assert
 (= (+ (* (- _a_3_) l_0_3_1) _a_3_) 0.0))
(assert
 (= (- (+ (+ (* (- _a_4_) l_0_3_1) _a_4_) l_0_3_3) l_0_3_4) 0.0))
(assert
 (>= l_0_3_1 0.0))
(assert
 (>= l_0_3_2 0.0))
(assert
 (>= l_0_3_3 0.0))
(assert
 (>= l_0_3_4 0.0))
(assert
 (>= l_0_3_5 0.0))
(check-sat)
(get-model)