#lang rosette
(require rosette/lib/synthax)
(define-symbolic _a_0_ real?)
(define-symbolic _a_1_ real?)
(define-symbolic _a_2_ real?)
(define-symbolic _a_3_ real?)
(define-symbolic _a_4_ real?)
(define-symbolic _a_5_ real?)
(define-symbolic N_0 real?)
(define-symbolic n_0 real?)
(define-symbolic s_0 real?)
(define start (current-inexact-milliseconds))

(define sol
  (synthesize
   
   #:forall (list n_0 s_0 N_0)
   #:guarantee (and (implies (and (>= N_0 0)) (and (>= _a_0_ 0)))
(implies (and (>= (+ _a_0_ (* _a_1_ n_0) (* _a_2_ s_0) (* _a_4_ s_0**2) (* _a_5_ n_0**2) (* _a_3_ n_0 s_0)) 0) (>= -1.0 0)) (and (>= 1.0 0)))
(implies (and (>= (+ _a_0_ (* _a_1_ n_0) (* _a_2_ s_0) (* _a_4_ s_0**2) (* _a_5_ n_0**2) (* _a_3_ n_0 s_0)) 0) (>= 1.0 0)) (and (>= (+ _a_0_ (* 1.00000000000000 _a_1_) (* 1.00000000000000 _a_5_) (* _a_3_ n_0**6) (* _a_4_ n_0**10) (* _a_4_ s_0**2) (* _a_5_ n_0**2) (* n_0 (+ _a_1_ (* 2.00000000000000 _a_5_))) (* s_0 (+ _a_2_ (* 1.00000000000000 _a_3_))) (* n_0**5 (+ _a_2_ (* 1.00000000000000 _a_3_))) (* _a_3_ n_0 s_0) (* 2 _a_4_ s_0 n_0**5)) 0))))
   )
  )
(define end (current-inexact-milliseconds))
(print (- end start))
