#lang rosette
(require rosette/lib/synthax)
(define-symbolic _a_0_ real?)
(define-symbolic _a_1_ real?)
(define-symbolic _a_2_ real?)
(define-symbolic _a_3_ real?)
(define-symbolic _a_4_ real?)
(define-symbolic x1_0 real?)
(define-symbolic x2_0 real?)
(define-symbolic y1_0 real?)
(define-symbolic y3_0 real?)
(define-symbolic y2_0 real?)
(define start (current-inexact-milliseconds))

(define sol
  (synthesize
   
   #:forall (list x2_0 y2_0 y1_0 x1_0 y3_0)
   #:guarantee (and (implies (and (>= x1_0 0) (>= x2_0 0)) (and (>= (+ _a_0_ (* _a_2_ x1_0) (* _a_4_ x2_0)) 0)))
(implies (and (>= (+ _a_0_ (* _a_1_ y1_0) (* _a_2_ y3_0) (* _a_3_ y2_0) (* _a_4_ x2_0)) 0) (>= (* -1 y3_0) 0)) (and (>= 1.0 0)))
(implies (and (>= (+ _a_0_ (* _a_1_ y1_0) (* _a_2_ y3_0) (* _a_3_ y2_0) (* _a_4_ x2_0)) 0) (>= y3_0 0) (>= (+ -1.00000000000000 x2_0 (* -1 y2_0)) 0) (>= (+ 1.00000000000000 y2_0 (* -1 x2_0)) 0)) (and (>= (+ _a_0_ (* 1.00000000000000 _a_1_) (* -1.00000000000000 _a_2_) (* _a_1_ y1_0) (* _a_2_ y3_0) (* _a_4_ x2_0)) 0)))
(implies (and (>= (+ _a_0_ (* _a_1_ y1_0) (* _a_2_ y3_0) (* _a_3_ y2_0) (* _a_4_ x2_0)) 0) (>= y3_0 0) (>= (+ 1.00000000000000 y2_0 (* -1 x2_0)) 0) (>= (+ -1.00000000000000 x2_0 (* -1 y2_0)) 0)) (and (>= (+ _a_0_ (* 1.00000000000000 _a_3_) (* -1.00000000000000 _a_2_) (* _a_1_ y1_0) (* _a_2_ y3_0) (* _a_3_ y2_0) (* _a_4_ x2_0)) 0))))
   )
  )
(define end (current-inexact-milliseconds))
(print (- end start))
