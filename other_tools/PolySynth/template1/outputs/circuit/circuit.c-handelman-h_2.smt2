(set-option :produce-models true); benchmark generated from python API
(set-info :status unknown)
(declare-fun l_1_0_8 () Real)
(declare-fun l_1_0_7 () Real)
(declare-fun l_1_0_6 () Real)
(declare-fun l_1_0_5 () Real)
(declare-fun l_1_0_4 () Real)
(declare-fun l_1_0_3 () Real)
(declare-fun l_1_0_2 () Real)
(declare-fun l_1_0_11 () Real)
(declare-fun l_1_0_10 () Real)
(declare-fun l_1_0_1 () Real)
(declare-fun _a_0_ () Real)
(declare-fun l_1_0_14 () Real)
(declare-fun l_1_0_13 () Real)
(declare-fun l_1_0_12 () Real)
(declare-fun _a_1_ () Real)
(declare-fun _a_2_ () Real)
(declare-fun l_1_0_9 () Real)
(declare-fun _a_3_ () Real)
(declare-fun _a_4_ () Real)
(declare-fun _a_5_ () Real)
(declare-fun l_1_1_8 () Real)
(declare-fun l_1_1_6 () Real)
(declare-fun l_1_1_5 () Real)
(declare-fun l_1_1_3 () Real)
(declare-fun l_1_1_2 () Real)
(declare-fun l_1_1_17 () Real)
(declare-fun l_1_1_16 () Real)
(declare-fun l_1_1_14 () Real)
(declare-fun l_1_1_13 () Real)
(declare-fun l_1_1_11 () Real)
(declare-fun l_1_1_1 () Real)
(declare-fun l_1_1_9 () Real)
(declare-fun l_1_1_7 () Real)
(declare-fun l_1_1_4 () Real)
(declare-fun l_1_1_12 () Real)
(declare-fun l_1_1_10 () Real)
(declare-fun l_1_1_20 () Real)
(declare-fun l_1_1_19 () Real)
(declare-fun l_1_1_18 () Real)
(declare-fun l_1_1_15 () Real)
(declare-fun l_1_2_9 () Real)
(declare-fun l_1_2_8 () Real)
(declare-fun l_1_2_7 () Real)
(declare-fun l_1_2_6 () Real)
(declare-fun l_1_2_5 () Real)
(declare-fun l_1_2_2 () Real)
(declare-fun l_1_2_17 () Real)
(declare-fun l_1_2_16 () Real)
(declare-fun l_1_2_14 () Real)
(declare-fun l_1_2_13 () Real)
(declare-fun l_1_2_12 () Real)
(declare-fun l_1_2_4 () Real)
(declare-fun l_1_2_3 () Real)
(declare-fun l_1_2_11 () Real)
(declare-fun l_1_2_10 () Real)
(declare-fun l_1_2_1 () Real)
(declare-fun l_1_2_15 () Real)
(declare-fun l_1_2_18 () Real)
(declare-fun l_1_2_20 () Real)
(declare-fun l_1_2_19 () Real)
(assert
 (let ((?x1587 (* (/ 1.0 8.0) l_1_0_7)))
 (let ((?x46 (* (/ 1.0 8.0) l_1_0_5)))
 (let ((?x1590 (* (/ 1.0 8.0) l_1_0_3)))
 (let ((?x52 (* (/ 1.0 64.0) l_1_0_2)))
 (let ((?x1593 (* l_1_0_11 l_1_0_11)))
 (let ((?x47 (- (- (- (- (- _a_0_ l_1_0_1) (* l_1_0_10 l_1_0_10)) ?x1593) ?x52) ?x1590)))
 (= (- (- (- (- (- ?x47 l_1_0_4) ?x46) l_1_0_6) ?x1587) l_1_0_8) 0.0))))))))
(assert
 (let ((?x1390 (* (/ 3.0 4.0) l_1_0_2)))
 (let ((?x1389 (* l_1_0_14 l_1_0_14)))
 (let ((?x581 (- (- (- _a_1_ (* l_1_0_12 l_1_0_12)) (* l_1_0_13 l_1_0_13)) ?x1389)))
 (= (+ (+ (+ (- ?x581 ?x1390) l_1_0_3) l_1_0_5) l_1_0_7) 0.0)))))
(assert
 (let ((?x1297 (* 1.0 l_1_0_7)))
 (let ((?x51 (* 1.0 l_1_0_5)))
 (let ((?x1294 (* 1.0 l_1_0_3)))
 (let ((?x1070 (* (/ 1.0 4.0) l_1_0_2)))
 (let ((?x1293 (- (- _a_2_ (* (* 2.0 l_1_0_10) l_1_0_12)) (* (* 2.0 l_1_0_11) l_1_0_13))))
 (= (- (- (- (- ?x1293 ?x1070) ?x1294) ?x51) ?x1297) 0.0)))))))
(assert
 (let ((?x1297 (* 1.0 l_1_0_7)))
 (let ((?x51 (* 1.0 l_1_0_5)))
 (let ((?x1294 (* 1.0 l_1_0_3)))
 (let ((?x1070 (* (/ 1.0 4.0) l_1_0_2)))
 (let ((?x1148 (- (- (- (- _a_3_ (* (* 2.0 l_1_0_10) l_1_0_9)) ?x1070) ?x1294) ?x51)))
 (= (- ?x1148 ?x1297) 0.0)))))))
(assert
 (let ((?x1170 (* l_1_0_9 l_1_0_9)))
 (let ((?x1169 (+ (+ (+ (- _a_4_ (* (/ 3.0 4.0) l_1_0_2)) l_1_0_3) l_1_0_5) l_1_0_7)))
 (= (- ?x1169 ?x1170) 0.0))))
(assert
 (let ((?x1064 (* 2.0 l_1_0_2)))
 (= (- (- _a_5_ (* (* 2.0 l_1_0_12) l_1_0_9)) ?x1064) 0.0)))
(assert
 (= (- l_1_0_2) 0.0))
(assert
 (let ((?x1064 (* 2.0 l_1_0_2)))
 (= ?x1064 0.0)))
(assert
 (let ((?x995 (* (- 2.0) l_1_0_2)))
 (= ?x995 0.0)))
(assert
 (let ((?x1064 (* 2.0 l_1_0_2)))
 (= ?x1064 0.0)))
(assert
 (let ((?x1064 (* 2.0 l_1_0_2)))
 (= ?x1064 0.0)))
(assert
 (= (- l_1_0_2) 0.0))
(assert
 (let ((?x1064 (* 2.0 l_1_0_2)))
 (= ?x1064 0.0)))
(assert
 (>= l_1_0_1 0.0))
(assert
 (>= l_1_0_2 0.0))
(assert
 (>= l_1_0_3 0.0))
(assert
 (>= l_1_0_4 0.0))
(assert
 (>= l_1_0_5 0.0))
(assert
 (>= l_1_0_6 0.0))
(assert
 (>= l_1_0_7 0.0))
(assert
 (>= l_1_0_8 0.0))
(assert
 (>= l_1_0_9 0.0))
(assert
 (>= l_1_0_11 0.0))
(assert
 (>= l_1_0_14 0.0))
(assert
 (let ((?x35 (* l_1_1_17 l_1_1_17)))
 (let ((?x37 (* l_1_1_16 l_1_1_16)))
 (let ((?x966 (* _a_0_ l_1_1_7)))
 (let ((?x964 (* _a_0_ l_1_1_4)))
 (let ((?x967 (- (- (- (* (* 1.0 _a_0_) l_1_1_10) (* _a_0_ l_1_1_12)) ?x964) ?x966)))
 (let ((?x973 (+ (+ (+ ?x967 (* (* 1.0 _a_0_) l_1_1_9)) (* 1.0 l_1_1_1)) (* 1.0 l_1_1_11))))
 (let ((?x31 (- (- (- (- (- ?x973 l_1_1_13) l_1_1_14) ?x37) ?x35) (* (* l_1_1_2 _a_0_) _a_0_))))
 (let ((?x25 (- (- (- (+ ?x31 (* 1.0 l_1_1_3)) l_1_1_5) l_1_1_6) (* 1.0 l_1_1_8))))
 (= (+ ?x25 4.0) 0.0))))))))))
(assert
 (let ((?x712 (* l_1_1_20 l_1_1_20)))
 (let ((?x748 (* l_1_1_19 l_1_1_19)))
 (let ((?x746 (* l_1_1_18 l_1_1_18)))
 (let ((?x800 (* _a_1_ l_1_1_7)))
 (let ((?x798 (* _a_1_ l_1_1_4)))
 (let ((?x744 (- (- (- (* (* 1.0 _a_1_) l_1_1_10) (* _a_1_ l_1_1_12)) ?x798) ?x800)))
 (let ((?x709 (- (- (- (+ ?x744 (* (* 1.0 _a_1_) l_1_1_9)) ?x746) ?x748) (* l_1_1_2 (+ (* (* 2.0 _a_0_) _a_1_) (* _a_2_ _a_2_))))))
 (= (- (- ?x709 ?x712) 1.0) 0.0)))))))))
(assert
 (let ((?x515 (* _a_2_ l_1_1_7)))
 (let ((?x513 (* _a_2_ l_1_1_4)))
 (let ((?x511 (* _a_2_ l_1_1_12)))
 (let ((?x508 (+ (* (* (* (- 2.0) _a_0_) _a_2_) l_1_1_2) (* (* 1.0 _a_2_) l_1_1_10))))
 (let ((?x518 (+ (- (- (- ?x508 ?x511) ?x513) ?x515) (* (* 1.0 _a_2_) l_1_1_9))))
 (let ((?x434 (- (- ?x518 (* (* 2.0 l_1_1_16) l_1_1_18)) (* (* 2.0 l_1_1_17) l_1_1_19))))
 (= ?x434 0.0))))))))
(assert
 (let ((?x381 (* _a_3_ l_1_1_7)))
 (let ((?x382 (* _a_3_ l_1_1_4)))
 (let ((?x383 (* _a_3_ l_1_1_12)))
 (let ((?x16 (+ (* (* (* (- 2.0) _a_0_) _a_3_) l_1_1_2) (* (* 1.0 _a_3_) l_1_1_10))))
 (let ((?x15 (+ (- (- (- ?x16 ?x383) ?x382) ?x381) (* (* 1.0 _a_3_) l_1_1_9))))
 (= (- ?x15 (* (* 2.0 l_1_1_15) l_1_1_16)) 0.0)))))))
(assert
 (let ((?x323 (* l_1_1_15 l_1_1_15)))
 (let ((?x321 (* _a_4_ l_1_1_7)))
 (let ((?x334 (* _a_4_ l_1_1_4)))
 (let ((?x310 (- (- (- (* (* 1.0 _a_4_) l_1_1_10) (* _a_4_ l_1_1_12)) ?x334) ?x321)))
 (let ((?x282 (- (- (+ ?x310 (* (* 1.0 _a_4_) l_1_1_9)) ?x323) (* l_1_1_2 (+ (* (* 2.0 _a_0_) _a_4_) (* _a_3_ _a_3_))))))
 (= ?x282 0.0)))))))
(assert
 (let ((?x198 (+ (* (* 2.0 _a_0_) _a_5_) (* (* 2.0 _a_2_) _a_3_))))
 (let ((?x183 (* _a_5_ l_1_1_7)))
 (let ((?x181 (* _a_5_ l_1_1_4)))
 (let ((?x185 (- (- (- (* (* 1.0 _a_5_) l_1_1_10) (* _a_5_ l_1_1_12)) ?x181) ?x183)))
 (let ((?x192 (- (+ ?x185 (* (* 1.0 _a_5_) l_1_1_9)) (* (* 2.0 l_1_1_15) l_1_1_18))))
 (= (- ?x192 (* l_1_1_2 ?x198)) 0.0)))))))
(assert
 (= (* (* (- l_1_1_2) _a_1_) _a_1_) 0.0))
(assert
 (= (* (* (* (- 2.0) _a_1_) _a_2_) l_1_1_2) 0.0))
(assert
 (let ((?x624 (+ (* (* 2.0 _a_1_) _a_3_) (* (* 2.0 _a_2_) _a_5_))))
 (let ((?x1200 (- l_1_1_2)))
 (= (* ?x1200 ?x624) 0.0))))
(assert
 (let ((?x163 (* _a_5_ _a_5_)))
 (let ((?x169 (+ (* (* 2.0 _a_1_) _a_4_) ?x163)))
 (let ((?x1200 (- l_1_1_2)))
 (= (* ?x1200 ?x169) 0.0)))))
(assert
 (= (* (* (* (- 2.0) _a_1_) _a_5_) l_1_1_2) 0.0))
(assert
 (let ((?x1307 (+ (* (* 2.0 _a_2_) _a_4_) (* (* 2.0 _a_3_) _a_5_))))
 (let ((?x1200 (- l_1_1_2)))
 (= (* ?x1200 ?x1307) 0.0))))
(assert
 (= (* (* (* (- 2.0) _a_3_) _a_4_) l_1_1_2) 0.0))
(assert
 (= (* (* (- l_1_1_2) _a_4_) _a_4_) 0.0))
(assert
 (= (* (* (* (- 2.0) _a_4_) _a_5_) l_1_1_2) 0.0))
(assert
 (>= l_1_1_1 0.0))
(assert
 (>= l_1_1_2 0.0))
(assert
 (>= l_1_1_3 0.0))
(assert
 (>= l_1_1_4 0.0))
(assert
 (>= l_1_1_5 0.0))
(assert
 (>= l_1_1_6 0.0))
(assert
 (>= l_1_1_7 0.0))
(assert
 (>= l_1_1_8 0.0))
(assert
 (>= l_1_1_9 0.0))
(assert
 (>= l_1_1_10 0.0))
(assert
 (>= l_1_1_11 0.0))
(assert
 (>= l_1_1_12 0.0))
(assert
 (>= l_1_1_13 0.0))
(assert
 (>= l_1_1_14 0.0))
(assert
 (>= l_1_1_15 0.0))
(assert
 (>= l_1_1_17 0.0))
(assert
 (>= l_1_1_20 0.0))
(assert
 (let ((?x1090 (* l_1_2_17 l_1_2_17)))
 (let ((?x1212 (* l_1_2_16 l_1_2_16)))
 (let ((?x219 (* _a_0_ l_1_2_3)))
 (let ((?x693 (* _a_0_ l_1_2_11)))
 (let ((?x694 (- (- (* (- _a_0_) l_1_2_1) (* (* 1.0 _a_0_) l_1_2_10)) ?x693)))
 (let ((?x1530 (- (+ (- (- ?x694 ?x219) (* (* 1.0 _a_0_) l_1_2_4)) _a_0_) l_1_2_12)))
 (let ((?x153 (- (- (- (- (- ?x1530 (* 1.0 l_1_2_13)) l_1_2_14) ?x1212) ?x1090) l_1_2_2)))
 (let ((?x839 (- (- (- (- ?x153 (* 1.0 l_1_2_5)) l_1_2_6) (* 1.0 l_1_2_7)) (* (* l_1_2_8 _a_0_) _a_0_))))
 (= (- ?x839 (* 1.0 l_1_2_9)) 0.0))))))))))
(assert
 (let ((?x1384 (* l_1_2_15 l_1_2_15)))
 (let ((?x489 (* (/ 888888888888889.0 10000000000000000.0) _a_5_)))
 (let ((?x786 (* (/ 790123456790123.0 1000000000000000.0) _a_4_)))
 (let ((?x776 (* _a_4_ l_1_2_3)))
 (let ((?x791 (* _a_4_ l_1_2_11)))
 (let ((?x782 (- (- (* (/ 1.0 100.0) _a_1_) (* _a_4_ l_1_2_1)) (* (* 1.0 _a_4_) l_1_2_10))))
 (let ((?x476 (+ (- (- (- ?x782 ?x791) ?x776) (* (* 1.0 _a_4_) l_1_2_4)) ?x786)))
 (let ((?x763 (- (- (+ ?x476 ?x489) ?x1384) (* l_1_2_8 (+ (* (* 2.0 _a_0_) _a_4_) (* _a_3_ _a_3_))))))
 (= ?x763 0.0))))))))))
(assert
 (let ((?x198 (+ (* (* 2.0 _a_0_) _a_5_) (* (* 2.0 _a_2_) _a_3_))))
 (let ((?x465 (* (/ 198611111111111.0 250000000000000.0) _a_5_)))
 (let ((?x1446 (* _a_5_ l_1_2_3)))
 (let ((?x877 (* _a_5_ l_1_2_11)))
 (let ((?x876 (- (- (- (* (/ 9.0 50.0) _a_1_) (* (/ 493827160493827.0 5000000000000000.0) _a_4_)) (* _a_5_ l_1_2_1)) (* (* 1.0 _a_5_) l_1_2_10))))
 (let ((?x453 (+ (- (- (- ?x876 ?x877) ?x1446) (* (* 1.0 _a_5_) l_1_2_4)) ?x465)))
 (= (- (- ?x453 (* (* 2.0 l_1_2_15) l_1_2_18)) (* l_1_2_8 ?x198)) 0.0))))))))
(assert
 (let ((?x1349 (* l_1_2_20 l_1_2_20)))
 (let ((?x1352 (* l_1_2_19 l_1_2_19)))
 (let ((?x817 (* l_1_2_18 l_1_2_18)))
 (let ((?x816 (* (/ 1.0 20.0) _a_5_)))
 (let ((?x809 (* (/ 154320987654321.0 50000000000000000.0) _a_4_)))
 (let ((?x303 (* (/ 81.0 100.0) _a_1_)))
 (let ((?x1094 (* _a_1_ l_1_2_3)))
 (let ((?x1104 (* _a_1_ l_1_2_11)))
 (let ((?x1105 (- (- (* (- _a_1_) l_1_2_1) (* (* 1.0 _a_1_) l_1_2_10)) ?x1104)))
 (let ((?x815 (+ (+ (- (- ?x1105 ?x1094) (* (* 1.0 _a_1_) l_1_2_4)) ?x303) ?x809)))
 (let ((?x1237 (- (- (- (- (- ?x815 ?x816) ?x817) ?x1352) ?x1349) (* l_1_2_8 (+ (* (* 2.0 _a_0_) _a_1_) (* _a_2_ _a_2_))))))
 (= ?x1237 0.0)))))))))))))
(assert
 (let ((?x500 (* (/ 888888888888889.0 1000000000000000.0) _a_3_)))
 (let ((?x491 (* _a_3_ l_1_2_3)))
 (let ((?x496 (* _a_3_ l_1_2_11)))
 (let ((?x469 (* _a_3_ l_1_2_1)))
 (let ((?x481 (- (+ (* (* (* (- 2.0) _a_0_) _a_3_) l_1_2_8) (* (/ 1.0 10.0) _a_2_)) ?x469)))
 (let ((?x487 (- (- (- (- ?x481 (* (* 1.0 _a_3_) l_1_2_10)) ?x496) ?x491) (* (* 1.0 _a_3_) l_1_2_4))))
 (= (- (+ ?x487 ?x500) (* (* 2.0 l_1_2_15) l_1_2_16)) 0.0))))))))
(assert
 (let ((?x1117 (* (/ 138888888888889.0 2500000000000000.0) _a_3_)))
 (let ((?x1203 (* (/ 9.0 10.0) _a_2_)))
 (let ((?x697 (* _a_2_ l_1_2_3)))
 (let ((?x700 (* _a_2_ l_1_2_11)))
 (let ((?x538 (* _a_2_ l_1_2_1)))
 (let ((?x699 (- (- (* (* (* (- 2.0) _a_0_) _a_2_) l_1_2_8) ?x538) (* (* 1.0 _a_2_) l_1_2_10))))
 (let ((?x1115 (+ (- (- (- ?x699 ?x700) ?x697) (* (* 1.0 _a_2_) l_1_2_4)) ?x1203)))
 (let ((?x1080 (- (- (- ?x1115 ?x1117) (* (* 2.0 l_1_2_16) l_1_2_18)) (* (* 2.0 l_1_2_17) l_1_2_19))))
 (= ?x1080 0.0))))))))))
(assert
 (= (* (* (- l_1_2_8) _a_1_) _a_1_) 0.0))
(assert
 (= (* (* (* (- 2.0) _a_1_) _a_2_) l_1_2_8) 0.0))
(assert
 (let ((?x624 (+ (* (* 2.0 _a_1_) _a_3_) (* (* 2.0 _a_2_) _a_5_))))
 (let ((?x1282 (- l_1_2_8)))
 (= (* ?x1282 ?x624) 0.0))))
(assert
 (let ((?x163 (* _a_5_ _a_5_)))
 (let ((?x169 (+ (* (* 2.0 _a_1_) _a_4_) ?x163)))
 (let ((?x1282 (- l_1_2_8)))
 (= (* ?x1282 ?x169) 0.0)))))
(assert
 (= (* (* (* (- 2.0) _a_1_) _a_5_) l_1_2_8) 0.0))
(assert
 (let ((?x1307 (+ (* (* 2.0 _a_2_) _a_4_) (* (* 2.0 _a_3_) _a_5_))))
 (let ((?x1282 (- l_1_2_8)))
 (= (* ?x1282 ?x1307) 0.0))))
(assert
 (= (* (* (* (- 2.0) _a_3_) _a_4_) l_1_2_8) 0.0))
(assert
 (= (* (* (- l_1_2_8) _a_4_) _a_4_) 0.0))
(assert
 (= (* (* (* (- 2.0) _a_4_) _a_5_) l_1_2_8) 0.0))
(assert
 (>= l_1_2_1 0.0))
(assert
 (>= l_1_2_2 0.0))
(assert
 (>= l_1_2_3 0.0))
(assert
 (>= l_1_2_4 0.0))
(assert
 (>= l_1_2_5 0.0))
(assert
 (>= l_1_2_6 0.0))
(assert
 (>= l_1_2_7 0.0))
(assert
 (>= l_1_2_8 0.0))
(assert
 (>= l_1_2_9 0.0))
(assert
 (>= l_1_2_10 0.0))
(assert
 (>= l_1_2_11 0.0))
(assert
 (>= l_1_2_12 0.0))
(assert
 (>= l_1_2_13 0.0))
(assert
 (>= l_1_2_14 0.0))
(assert
 (>= l_1_2_15 0.0))
(assert
 (>= l_1_2_17 0.0))
(assert
 (>= l_1_2_20 0.0))
(check-sat)
(get-model)