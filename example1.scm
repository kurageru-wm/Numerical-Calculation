(use numcal)

;; y' = y/(x + 1)
;; y(0)=1
;; h=0.0005

(define (f x y)
  (/ y (+ x 1)))

(define (main args)
  (print (euler 0 1 0.0005 5 f))
  )
