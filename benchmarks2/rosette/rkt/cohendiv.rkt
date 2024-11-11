#lang rosette
(require rosette/lib/synthax)
(define-symbolic _a_0_ real?)
(define-symbolic _a_1_ real?)
(define-symbolic _a_2_ real?)
(define-symbolic _a_3_ real?)
(define-symbolic _a_4_ real?)
(define-symbolic _a_5_ real?)
(define-symbolic _a_6_ real?)
(define-symbolic _a_7_ real?)
(define-symbolic _a_8_ real?)
(define-symbolic _a_9_ real?)
(define-symbolic x_0 real?)
(define-symbolic y_0 real?)
(define-symbolic d_0 real?)
(define-symbolic r_0 real?)
(define start (current-inexact-milliseconds))

(define sol
  (synthesize
   
   #:forall (list d_0 x_0 r_0 y_0)
   #:guarantee (and (implies (and (>= x_0 0) (>= (+ -1.00000000000000 y_0) 0)) (and (>= (+ _a_0_ (* _a_1_ x_0**2) (* _a_3_ d_0**2) (* _a_4_ y_0**2) (* _a_6_ d_0) (* _a_7_ y_0) (* _a_8_ x_0) (* _a_2_ d_0 x_0) (* _a_5_ x_0 y_0) (* _a_9_ d_0 y_0)) 0)))
(implies (and (>= (+ _a_0_ (* _a_1_ r_0**2) (* _a_3_ d_0**2) (* _a_4_ y_0**2) (* _a_6_ d_0) (* _a_7_ y_0) (* _a_8_ r_0) (* _a_2_ d_0 r_0) (* _a_5_ r_0 y_0) (* _a_9_ d_0 y_0)) 0) (>= (+ y_0 (* -1 r_0)) 0)) (and (>= 1.0 0)))
(implies (and (>= (+ _a_0_ (* _a_1_ r_0**2) (* _a_3_ d_0**2) (* _a_4_ y_0**2) (* _a_6_ d_0) (* _a_7_ y_0) (* _a_8_ r_0) (* _a_2_ d_0 r_0) (* _a_5_ r_0 y_0) (* _a_9_ d_0 y_0)) 0) (>= (+ r_0 (* -1 y_0)) 0)) (and (>= (+ _a_0_ (* _a_1_ r_0**2) (* _a_3_ d_0**2) (* _a_4_ y_0**2) (* _a_6_ d_0) (* _a_7_ y_0) (* _a_8_ r_0) (* _a_1_ d_0**2 y_0**2) (* _a_2_ d_0 r_0) (* _a_5_ r_0 y_0) (* d_0 y_0 (+ _a_9_ (* -1 _a_8_))) (* -1 _a_2_ y_0 d_0**2) (* -1 _a_5_ d_0 y_0**2) (* -2 _a_1_ d_0 r_0 y_0)) 0))))
   )
  )
(define end (current-inexact-milliseconds))
(print (- end start))
