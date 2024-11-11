#lang rosette
(require rosette/lib/synthax)
(define-symbolic _a_0_ real?)
(define-symbolic _a_1_ real?)
(define-symbolic _a_2_ real?)
(define-symbolic _a_3_ real?)
(define-symbolic _a_4_ real?)
(define-symbolic _a_5_ real?)
(define-symbolic a_0 real?)
(define-symbolic x_0 real?)
(define-symbolic r_0 real?)
(define start (current-inexact-milliseconds))

(define sol
  (synthesize
   
   #:forall (list x_0 a_0 r_0)
   #:guarantee (and (implies (and (>= a_0 0)) (and (>= (+ _a_1_ (* a_0 (+ -1 (* 0.500000000000000 _a_5_))) (* 0.250000000000000 _a_0_ a_0**2)) 0)))
(implies (and (>= a_0 0)) (and (>= (+ (* -1 _a_1_) (* a_0 (+ 1 (* -0.500000000000000 _a_5_))) (* -0.250000000000000 _a_0_ a_0**2)) 0)))
(implies (and (>= a_0 0)) (and (>= 0 0)))
(implies (and (>= a_0 0)) (and (>= 0 0)))
(implies (and (>= (+ _a_1_ (* -1 a_0) (* _a_0_ x_0**2) (* _a_2_ r_0**2) (* _a_4_ r_0) (* _a_5_ x_0) (* _a_3_ r_0 x_0)) 0) (>= (+ a_0 (* -1 _a_1_) (* -1 _a_0_ x_0**2) (* -1 _a_2_ r_0**2) (* -1 _a_4_ r_0) (* -1 _a_5_ x_0) (* -1 _a_3_ r_0 x_0)) 0) (>= (+ a_0 r_0 (* -1 r_0**2) (* -2.00000000000000 x_0)) 0) (>= (+ r_0**2 (* -1 a_0) (* -1 r_0) (* 2.00000000000000 x_0)) 0) (>= (+ r_0 (* -1 x_0)) 0)) (and (>= (+ r_0**2 (* -1 a_0) (* 1.00000000000000 r_0)) 0)))
(implies (and (>= (+ _a_1_ (* -1 a_0) (* _a_0_ x_0**2) (* _a_2_ r_0**2) (* _a_4_ r_0) (* _a_5_ x_0) (* _a_3_ r_0 x_0)) 0) (>= (+ a_0 (* -1 _a_1_) (* -1 _a_0_ x_0**2) (* -1 _a_2_ r_0**2) (* -1 _a_4_ r_0) (* -1 _a_5_ x_0) (* -1 _a_3_ r_0 x_0)) 0) (>= (+ a_0 r_0 (* -1 r_0**2) (* -2.00000000000000 x_0)) 0) (>= (+ r_0**2 (* -1 a_0) (* -1 r_0) (* 2.00000000000000 x_0)) 0) (>= (+ r_0 (* -1 x_0)) 0)) (and (>= (+ a_0 r_0 (* -1 r_0**2)) 0)))
(implies (and (>= (+ _a_1_ (* -1 a_0) (* _a_0_ x_0**2) (* _a_2_ r_0**2) (* _a_4_ r_0) (* _a_5_ x_0) (* _a_3_ r_0 x_0)) 0) (>= (+ a_0 (* -1 _a_1_) (* -1 _a_0_ x_0**2) (* -1 _a_2_ r_0**2) (* -1 _a_4_ r_0) (* -1 _a_5_ x_0) (* -1 _a_3_ r_0 x_0)) 0) (>= (+ a_0 r_0 (* -1 r_0**2) (* -2.00000000000000 x_0)) 0) (>= (+ r_0**2 (* -1 a_0) (* -1 r_0) (* 2.00000000000000 x_0)) 0) (>= (+ x_0 (* -1 r_0)) 0)) (and (>= (+ _a_1_ (* -1 a_0) (* 1.00000000000000 _a_2_) (* 1.00000000000000 _a_4_) (* _a_0_ x_0**2) (* r_0 (+ _a_4_ (* -1 _a_5_) (* 2.00000000000000 _a_2_) (* -1.00000000000000 _a_3_))) (* x_0 (+ _a_5_ (* 1.00000000000000 _a_3_))) (* r_0**2 (+ _a_0_ _a_2_ (* -1 _a_3_))) (* r_0 x_0 (+ _a_3_ (* -2 _a_0_)))) 0)))
(implies (and (>= (+ _a_1_ (* -1 a_0) (* _a_0_ x_0**2) (* _a_2_ r_0**2) (* _a_4_ r_0) (* _a_5_ x_0) (* _a_3_ r_0 x_0)) 0) (>= (+ a_0 (* -1 _a_1_) (* -1 _a_0_ x_0**2) (* -1 _a_2_ r_0**2) (* -1 _a_4_ r_0) (* -1 _a_5_ x_0) (* -1 _a_3_ r_0 x_0)) 0) (>= (+ a_0 r_0 (* -1 r_0**2) (* -2.00000000000000 x_0)) 0) (>= (+ r_0**2 (* -1 a_0) (* -1 r_0) (* 2.00000000000000 x_0)) 0) (>= (+ x_0 (* -1 r_0)) 0)) (and (>= (+ a_0 (* -1 _a_1_) (* -1.00000000000000 _a_2_) (* -1.00000000000000 _a_4_) (* r_0 (+ _a_5_ (* -1 _a_4_) (* 1.00000000000000 _a_3_) (* -2.00000000000000 _a_2_))) (* x_0 (+ (* -1 _a_5_) (* -1.00000000000000 _a_3_))) (* r_0**2 (+ _a_3_ (* -1 _a_0_) (* -1 _a_2_))) (* -1 _a_0_ x_0**2) (* r_0 x_0 (+ (* -1 _a_3_) (* 2 _a_0_)))) 0)))
(implies (and (>= (+ _a_1_ (* -1 a_0) (* _a_0_ x_0**2) (* _a_2_ r_0**2) (* _a_4_ r_0) (* _a_5_ x_0) (* _a_3_ r_0 x_0)) 0) (>= (+ a_0 (* -1 _a_1_) (* -1 _a_0_ x_0**2) (* -1 _a_2_ r_0**2) (* -1 _a_4_ r_0) (* -1 _a_5_ x_0) (* -1 _a_3_ r_0 x_0)) 0) (>= (+ a_0 r_0 (* -1 r_0**2) (* -2.00000000000000 x_0)) 0) (>= (+ r_0**2 (* -1 a_0) (* -1 r_0) (* 2.00000000000000 x_0)) 0) (>= (+ x_0 (* -1 r_0)) 0)) (and (>= (+ a_0 (* -1 r_0**2) (* 1.00000000000000 r_0) (* -2.00000000000000 x_0)) 0)))
(implies (and (>= (+ _a_1_ (* -1 a_0) (* _a_0_ x_0**2) (* _a_2_ r_0**2) (* _a_4_ r_0) (* _a_5_ x_0) (* _a_3_ r_0 x_0)) 0) (>= (+ a_0 (* -1 _a_1_) (* -1 _a_0_ x_0**2) (* -1 _a_2_ r_0**2) (* -1 _a_4_ r_0) (* -1 _a_5_ x_0) (* -1 _a_3_ r_0 x_0)) 0) (>= (+ a_0 r_0 (* -1 r_0**2) (* -2.00000000000000 x_0)) 0) (>= (+ r_0**2 (* -1 a_0) (* -1 r_0) (* 2.00000000000000 x_0)) 0) (>= (+ x_0 (* -1 r_0)) 0)) (and (>= (+ r_0**2 (* -1 a_0) (* 2.00000000000000 x_0) (* -1.00000000000000 r_0)) 0))))
   )
  )
(define end (current-inexact-milliseconds))
(print (- end start))