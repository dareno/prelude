(global-visual-line-mode 1)
(setq default-directory "/Users/dreno200/")

(prelude-require-packages '(all-the-icons all-the-icons-ivy-rich org-journal org-roam deft))

;; all the icons

(require 'all-the-icons)
(require 'all-the-icons-ivy-rich)
(require 'ivy-rich)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
(all-the-icons-ivy-rich-mode 1)
(ivy-rich-mode 1)

;; dired
;; use tab to open sub dirs
(define-key dired-mode-map (kbd "TAB") 'dired-subtree-toggle)

;; recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; probably only for programming but setting globally for now
(global-set-key (kbd "C-c C-w") 'fixup-whitespace)

;; search or browse from https://emacs.stackexchange.com/questions/21475/browse-url-how-to-search-the-web-for-the-keyword-if-the-word-under-cursor-or-s
(defun my-search-or-browse ()
  "If selected region, or thing at point, is a url, go there. Otherwise,
use region/thing as a keyword for a google search."
  (interactive)
  (let ((target
         (if (use-region-p)
             (buffer-substring (region-beginning) (region-end))
           (thing-at-point 'symbol))))
    (if (ffap-url-p target)
        (browse-url target)
      (browse-url (concat "http://www.google.com/search?q="
                          (url-hexify-string target))))))

;; enable hideshow minor mode for code folding and use a better map key
(add-hook 'prelude-prog-mode-hook 'hs-minor-mode t)
(require 'hideshow) ;; need this to set the following key variable
(define-key hs-minor-mode-map (kbd "C-c h") (lookup-key hs-minor-mode-map (kbd "C-c @")))

(setq projectile-project-search-path '(
                                       ;; "~/Documents/dev/"
                                       "/:pi@10.0.0.190:/home/pi/dev/hsec/"))

;; xref - use dumb-jump as backend for xref.
;; needs 'brew install ripgrep'
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

;; markdown support
;;(require 'package)
;;(add-to-list 'package-archives
  ;;           '("melpa-stable" . "https://stable.melpa.org/packages/"))
;;(package-initialize)
