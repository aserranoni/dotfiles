;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
(global-auto-revert-mode)
(setq native-comp-async-report-warnings-errors nil)
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Ariel Serranoni"
      user-mail-address "arielserranoni@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
   (setq doom-font (font-spec :family "Fira Code" :size 14 :weight 'normal)
      doom-variable-pitch-font (font-spec :family "Fira Code" :size 14))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume  the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tokyo-night)
;(setq doom-one-brighter-comments 't)
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)



;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;;
(setq org-directory "~/org-files/")
(setq rmh-elfeed-org-files
                         '("~/org-files/rssfeeds.org"))
(setq org-agenda-files     '("~/org-files/academic.org"
                             "~/org-files/personal.org"
                             "~/org-files/application.org"
                             "~/kaddex/tasks.org"))
(setq org-roam-directory "~/org-files/roam")
(setq org-noter-notes-search-path (quote ("~/org-files/")))
(setq org-ref-default-bibliography (quote
                                    ("~/coisas/matematicasdavida/Livros/library.bib")))

;;; Handling evil similar to spacemacs hybrid mode

(defalias 'evil-insert-state 'evil-emacs-state)
(define-key evil-emacs-state-map (kbd "<escape>") 'evil-normal-state)

;; Set custom faces for evil-mode states

(setq evil-visual-state-cursor '("firebrick" hbar))
(setq evil-normal-state-cursor '("green" box))
(setq evil-emacs-state-cursor '("white" bar))

;;; Trying to port my spacemacs previous config

;; neotree change root
  (setq neo-click-changes-root-toggle 't)

;; Enable doom modeline, ivy rich  and undo-tree globally
 (after! projectile (setq projectile-project-root-files-bottom-up (remove
    ".git" projectile-project-root-files-bottom-up)))

(all-the-icons-ivy-rich-mode)

;; Support multiple eshell instances
(defun eshell-new()
"Open a new instance of eshell."
(interactive)
(eshell 'N))

(after! pact-mode
;TODO: ADD FUNCTION TO +eval-repls list
(require 'comint)
(defun pact/open-repl ()
 "Open the Pact REPL"
(interactive)
(pop-to-buffer (get-buffer-create "*Pact*"))
(make-comint-in-buffer "pact" "*Pact*" "pact"))
(require 'flycheck-pact)
(add-to-list '+company-backend-alist '(pact-mode company-tide)))



;;; + Some of my favourite keybindings

(global-set-key (kbd "C-x s") (quote eshell)) ; open eshell
(global-set-key (kbd "C-s") (quote swiper))
(global-set-key (kbd "C-x b") (quote +ivy/switch-workspace-buffer))
(global-set-key (kbd "C-x C-2") (quote make-frame)) ;; open new frame
(global-set-key (kbd "C-x o") (quote ace-window))
(global-set-key (kbd "C-x u") (quote undo-tree-visualize)) ;;use undo tree with reasonable shortcut - NOT WORKING
(global-set-key (kbd "M-n l") (quote avy-goto-line))
(global-set-key (kbd "M-n w a") (quote avy-goto-word-0))
(global-set-key (kbd "M-n w c") (quote avy-goto-word-1))
(global-set-key (kbd "M-n c r") (quote avy-copy-region))
(global-set-key (kbd "M-n k r") (quote avy-kill-region))
(global-set-key (kbd "M-n m r") (quote avy-move-region))
(global-set-key (kbd "C-x w") (quote +hydra/window-nav/body))
(global-set-key (kbd "C-x z") (quote +hydra/text-zoom/body))
(global-set-key (kbd "C-c <left>") (quote winner-undo))
(global-set-key (kbd "C-c <right>") (quote winner-redo))
(global-set-key (kbd "C-x n t") (quote neotree))
(global-set-key (kbd "C-x C-b") (quote ivy-switch-buffer))
(setq avy-all-windows 't)

;; function to lookup current theme
(defun current-theme ()
  "Print the current theme."
  (interactive)
  (message "Current theme is %s" doom-theme))

;; function to get the current keymap

(defun current-keymap ()
  "Print the current keymap."
  (interactive)
  (message "Current keymap is %s" (current-active-maps)))

;; Setting up interaction with browser

(defun browse-url-ariel (url &optional _new-window)
   "Function to open url on windows google chrome browser
         - compatible with browse-url
         - useful for wsl users"
   (interactive "s")
   (shell-command
    (concat
     (concat
      "\"/mnt/d/Arquivos de Programas/Google/Chrome/Application/chrome.exe\"" " ") url ))
   )

(setq browse-url-browser-function 'browse-url-ariel)

(setq +lookup-open-url-fn 'browse-url-ariel)



(after! org
  (setq org-archive-location "~/org-files/archive.org::")
  (setq org-startup-align-all-tables t)
  (setq org-startup-folded t)

  (setq org-capture-templates
        '(("a" "Appointment" entry
           (file+olp "~/org-files/personal.org"
                     "External Communication"
                     "Appointments")
           "")
          ("r" "Talk to" entry
           (file+olp "~/org-files/personal.org"
                     "External Communication"
                     "Talk to")
           "")
          ("b" "Blog idea" entry
           (file+olp "~/org-files/application.org"
                     "Build/Improve Website"
                     "Add Content")
           "" :prepend t)
          ("t" "Task" entry
           (file+headline "~/org-files/notes.org"
                          "Captured Tasks")
           "")
          ("n" "Note" entry
           (file+headline "~/org-files/notes.org"
                          "Notespace")
           "")
          ("p" "Project" entry
           (file+olp "~/org-files/notes.org"
                     "Captured Projects")
           "")))

  (setq org-todo-keywords
        '((sequence "TODO(n)"
                    "Idea(i)"
                    "InProgress(p)"
                    "MissingRequirement(r@)"
                    "HugeObstacle(h@)"
                    "|"
                    "DONE(f@)"
                    "Cancelled(c@)")))

  (setq org-todo-keyword-faces
        '(("Idea" . "White")
          ("MissingRequirement" . "yellow")
          ("DONE" . "green")
          ("Cancelled" . "forest green")
          ("HugeObstacle" . "red")
          ("TODO" . "orange")))

  (setq org-ellipsis " ▼ ") ;; Other possible choices are ▼, ↴, ⬎, ⤷, and ⋱.

  (dolist (face'((org-level-1 . 1.5)
                (org-level-2 . 1.4)
                (org-level-3 . 1.3)
                (org-level-4 . 1.2)
                (org-level-5 . 1.1)
                (org-level-6 . 1.05)))
(set-face-attribute (car face) nil :font "Fira Code" :weight 'regular :height (cdr face)))



  (setq org-babel-load-languages '((python3 . t)
                                   (ipython . t)
                                   (emacs-lisp . t)
                                   (R . t)
                                   (shell-script . t)
                                   (jupyter . t)))

  ;(add-to-list 'org-mode-hook '(load-library 'jupyter))

  (add-to-list 'org-structure-template-alist '("jp" . "src jupyter-python"))

  (setq org-babel-default-header-args:jupyter-python '((:session . "py")))
  (setq org-babel-default-header-args:ipython '((:session . "Ipy")))


  (setq org-babel-python-command "python3")

  (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("py" . "src python"))
  (add-to-list 'org-structure-template-alist '("R" . "src R"))

  (setq org-hide-emphasis-markers 't)
  (setq local-bib (symbol-value 'org-ref-default-bibliography))
  (setq org-cite-global-bibliography (symbol-value 'org-ref-default-bibliography))
  (setq bibtex-completion-bibliography (symbol-value 'org-ref-default-bibliography))
  (setq ivy-bibtex-default-action 'ivy-bibtex-insert-citation)


;; Render ANSI in org-babel results
 (defun ek/babel-ansi ()
  (when-let ((beg (org-babel-where-is-src-block-result nil nil)))
    (save-excursion
      (goto-char beg)
      (when (looking-at org-babel-result-regexp)
        (let ((end (org-babel-result-end))
              (ansi-color-context-region nil))
          (ansi-color-apply-on-region beg end))))))
(add-hook 'org-babel-after-execute-hook 'ek/babel-ansi)

  )

(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (("C-c c" . 'copilot-complete)
         ("C-TAB" . 'copilot-accept-completion-by-word)
         ("C-<tab>" . 'copilot-accept-completion-by-word)
         :map copilot-completion-map
         ("<tab>" . 'copilot-accept-completion)
         ("TAB" . 'copilot-accept-completion)))

(after!  python-mode
  (add-to-list 'python-mode-hook 'lsp-deferred))

(after! ace-window
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  )

(after! chess
  (setq chess-default-engine 'gnuchess)
  )


(setq +doom-dashboard-banner-file "~/meditate.png")

(define-hostmode blazor-mode-hostmode
  :mode 'html-mode)

(define-innermode blazor-mode-csharp-innermode
  :mode 'csharp-mode
  :head-matcher "@code ?{"
  :tail-matcher "\t}"
  :head-mode 'host
  :tail-mode 'host)

(define-polymode blazor-mode
  :hostmode 'blazor-mode-hostmode
  :innermodes '(blazor-mode-csharp-innermode))

(add-to-list 'auto-mode-alist '("\\.razor\\'" . blazor-mode))

(defun ariel/adjust-frame-font-size ()
    (interactive)

    (let (
    (frame-font (font-spec :family "Fira Code" :size (read))))
    (set-frame-font frame-font))
    (message "Changed frame font size"))




 ;(require 'eaf-browser)
;; Whenever You Reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
