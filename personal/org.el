(require 'org-journal)
(setq org-directory "~/Dropbox/org")
(setq org-default-notes-file (concat org-directory "/inbox.org"))
(setq org-journal-dir (concat org-directory "/journal"))
(setq org-agenda-directory "~/Dropbox/org/")
(setq org-agenda-files '("~/Dropbox/org/" "~/Dropbox/org/habit/"))

;;(make-directory "~/Dropbox/org-roam")
(setq org-roam-directory "~/Dropbox/org-roam")
(setq org-roam-index-file "~/Dropbox/org-roam/20210114150306-index.org")
(add-hook 'after-init-hook 'org-roam-mode)
(setq org-enforce-todo-dependencies t)
(setq org-log-done (quote time))
(setq org-log-redeadline (quote time))
(setq org-log-reschedule (quote time))


;;
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))
(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)


(setq dcreno/org-agenda-todo-view
      `("a" "Agenda"
        ((agenda ""
                 ((org-agenda-span 'day)
                  (org-deadline-warning-days 365)))
         (todo "TODO"
               ((org-agenda-overriding-header "To Refile")
                ;; (org-agenda-files '(, "~/Dropbox/org/test2.org" ))
                (org-agenda-files '(,(concat org-agenda-directory "inbox.org")))
                ))
         (todo "NEXT"
               ((org-agenda-overriding-header "In Progress")
                ;; (org-agenda-files '(,"~/Dropbox/org/personal.org"))
                ;; (org-agenda-files '(,(concat org-agenda-directory "personal.org")))
                ))
         (todo "TODO"
               ((org-agenda-overriding-header "Someday - work")
                (org-agenda-files '(,(concat org-agenda-directory "comcast.org")))
                (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled))
                ))
         (todo "TODO"
               ((org-agenda-overriding-header "Someday - personal")
                (org-agenda-files '(,(concat org-agenda-directory "personal.org")))
                (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled))
                ))
         nil)))
(set 'org-agenda-custom-commands `(,dcreno/org-agenda-todo-view))
;; (add-to-list 'org-agenda-custom-commands `,dcreno/org-agenda-todo-view)
(require 'deft)
(setq deft-directory "~/Dropbox/org")
(setq deft-default-extension "org")
;; (setq deft-extensions '("org" "txt" "tex" "md" "markdown"))
(global-set-key [f9] 'deft)

(setq org-habit-show-all-today t)
(setq org-habit-preceding-days 7)
(setq org-habit-following-days 1)

(setq org-capture-templates
      `(("i" "inbox" entry (file ,(concat org-agenda-directory "inbox.org"))
         "* TODO %?")
        ("w" "work" entry (file ,(concat org-agenda-directory "comcast.org"))
         "* TODO %?")
        ("p" "personal" entry (file ,(concat org-agenda-directory "personal.org"))
         "* TODO %?")
        ))

;; for refiling org-agenda tasks from inbox.org
(setq org-refile-targets (quote (("comcast.org" :maxlevel . 1)
                                 ("personal.org" :maxlevel . 1))))
