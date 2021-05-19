;; see https://github.com/bbatsov/prelude/issues/1040
;;(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin"))
;;(org-babel-do-load-languages
;; 'org-babel-load-languages '((latex . t)(python . t) (R . t)))
(org-babel-do-load-languages
 'org-babel-load-languages '(
                             (shell . t)
                             (python . t)
                             ;; (Ipython . t) ;; causes org mode error
                             ;; because jupyter not installed?
                             (js . t) ))

;; see http://cachestocaches.com/2018/6/org-literate-programming/
;; Syntax highlight in #+BEGIN_SRC blocks
(setq org-src-fontify-natively t)
;; Don't prompt before running code in org
(setq org-confirm-babel-evaluate nil)
;; Fix an incompatibility between the ob-async and ob-ipython packages
(setq ob-async-no-async-languages-alist '("ipython"))

;; live linting of Clojure: https://github.com/borkdude/flycheck-clj-kondo
;;(require 'flycheck-clj-kondo) ;; breaks M-x describe-mode
(cider-auto-test-mode 1)
