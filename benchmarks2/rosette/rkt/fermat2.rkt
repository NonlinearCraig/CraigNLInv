#lang rosette
(require rosette/lib/synthax)
(define-symbolic _a_0_ real?)
(define-symbolic _a_1_ real?)
(define-symbolic R_0 real?)
(define-symbolic N_0 real?)
(define-symbolic r_0 real?)
(define start (current-inexact-milliseconds))

(define sol
  (synthesize
   
   #:forall (list r_0 R_0 N_0)
   #:guarantee (and (implies (and (>= (+ -1.00000000000000 N_0) 0) (>= (+ -2.00000000000000 N_0 (* -1 R_0**2) (* 2.00000000000000 R_0)) 0) (>= (+ R_0**2 (* -1 N_0)) 0)) (and (>= (+ _a_0_ (* N_0 _a_1_)) 0)))
(implies (and (>= (+ _a_0_ (* N_0 _a_1_)) 0) (>= (+ 1.00000000000000 (* -1 r_0)) 0)) (and (>= 1.0 0)))
(implies (and (>= (+ _a_0_ (* N_0 _a_1_)) 0) (>= (+ -1.00000000000000 r_0) 0) (>= r_0 0)) (and (>= (+ _a_0_ (* N_0 _a_1_)) 0)))
(implies (and (>= (+ _a_0_ (* N_0 _a_1_)) 0) (>= (+ -1.00000000000000 r_0) 0) (>= (* -1 r_0) 0)) (and (>= (+ _a_0_ (* N_0 _a_1_)) 0))))
   )
  )
(define end (current-inexact-milliseconds))
(print (- end start))
