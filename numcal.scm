(define-module numcal
  (export-all)
  )
(select-module numcal)


;; Euler Method
;; y' = f(x,y)

(define (euler x0 y0 h step f)
  (define (y1 x0 y0)
    (+ y0 (* h (f x0 y0))))  
  (if (zero? step)
      y0
      (euler (+ x0 h)
             (y1 x0 y0)
             h
             (- step 1)
             f)
      ))


;; Numerical Integration
(define (int a b div f)
  (* (/ (- b a) div)
     (let loop ((i div)
                (x (+ a (* (/ (- b a) div))))
                )
       ;; (print x ":" (f x))
       (if (= i 0)
           0
           (+ (f x)
              (loop (- i 1) (+ x (/ (- b a) div))))
           )))
  )
  
(define (f x)
  (/ 4.0 (+ 1 (* x x))))

(f 0.125)
(int 0 1 800 f)


(provide "numcal")