
;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs-base

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     windows-scripts
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ivy
     auto-completion
     ;javascript
     csv
     shell-scripts
     search-engine
     emacs-lisp
     (c-c++ :variables c-c++-enable-clang-support t)
     (latex :variables latex-enable-magic nil magic-latex-enable-suscript nil)
     bibtex
     (mu4e :variables mu4e-installation-path "/usr/share/emacs/site-lisp/mu4e")
     ess
     git
     pdf-tools
     rust
     html
     elfeed
     markdown
     ipython-notebook
     (python :variables python-backend 'lsp python-enable-yapf-format-on-save t python-sort-imports-on-save t)
     shell
     (org :variables
         org-agenda-files '("~/coisas/matematicasdavida/minhascoisas/org/academic.org"
                             "~/coisas/matematicasdavida/minhascoisas/org/personal.org"
                             "~/coisas/matematicasdavida/minhascoisas/org/application.org"))
     ;spell-checking

     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      workgroups2
                                      avy
                                      swiper
                                      tramp
                                      company-tabnine
                                      ace-window
                                      wolfram-mode
                                      neotree
                                      undo-tree
                                      ivy-rich
                                      org-trello
                                      org-bullets
                                      org-brain
                                      org-noter
                                      rainbow-delimiters
                                      elpy
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '(
                                  font-lock+
                                  org-plus-contrib
                                  org-projectile
                                 )

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(font-lock+
                                    org-plus-contrib
                                    org-projectile)

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading 'nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'nil

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((bookmarks . 5)
                                (recents . 5)
                                (agenda . 5)
                                (projects . 5))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'org-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message "Vamo que vamo!"

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("DejaVu Sans"
                               :size 14
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 15

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar nil

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'origami

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%a@%m@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of hitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup t

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."


;; Extra custom keybindings
  (global-set-key (kbd "C-x s") (quote eshell)) ;; open eshell
  (global-set-key (kbd "C-x C-2") (quote make-frame)) ;; open new frame
  ;;(global-set-key (kbd "C-s") (quote helm-occur)) ;; Helm fancy search
  (global-set-key (kbd "C-x w") (quote workgroups-mode)) ;; go-to workgroups
  (global-set-key (kbd "C-c s") (quote engine/search-duck-duck-go)) ;; search the web
  (global-set-key (kbd "C-c r") (quote rainbow-delimiters-mode)) ;; activate rainbow delimiters

;; Set wolfram mode for .m files - include other wolfram extensions
  (add-to-list 'auto-mode-alist '("\.m$" . wolfram-mode))
  ;; Set PDFView mode from pdf-tools as default to pdf files
  (add-hook 'emacs-startup-hook 'pdf-tools-install)
  (add-to-list 'auto-mode-alist '("\.pdf$" . pdf-view-mode))
;; Python mode hook - enable elpy
  (add-hook 'python-mode-hook #'elpy-mode)

;; Org-Noter


  (global-set-key (kbd "C-c C-n") (quote org-noter))
    (setq org-noter-default-notes-file-names (quote ("pdfnotes.org")))
    (setq org-noter-doc-property-in-notes t)
    (setq org-noter-notes-search-path (quote ("~/coisas/matematicasdavida/minhascoisas/org")))

;; Org-Brain


      (global-set-key (kbd "C-c C-b") (quote org-brain-visualize))
      (setq org-brain-path "~/coisas/matematicasdavida/minhascoisas/org/")


      ;; Ace Window

      (global-set-key [remap other-window] 'ace-window)
      (custom-set-faces
       '(aw-leading-char-face
         ((t (:inherit ace-jump-face-foreground :height 2.0)))))
      (global-set-key (kbd "C-x o") (quote ace-window))

      ;; Avy

    (avy-setup-default)
    (setq avy-all-windows t)
    (global-set-key (kbd "M-n w") (quote avy-goto-word-0)) ;; Navigate to word
    (global-set-key (kbd "M-n l") (quote avy-goto-line)) ;; Navigate ro line
    (global-set-key (kbd "M-n c r") (quote avy-kill-ring-save-region))
    (global-set-key (kbd "M-n k r") (quote avy-kill-region))


    ;; Support for multiple eshell instances

  (defun eshell-new()
    "Open a new instance of eshell."
    (interactive)
    (eshell 'N)
    )

  ;; Support for Windows Browser

  (defun browse-url-ariel (url &optional _new-window)
    "Function to open url on windows google chrome browser
          - compatible with browse-url
          - useful for wsl users"
    (interactive "s")
    (shell-command
     (concat
      (concat
       "\"/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe\"" " ") url ))
    )

  (setq browse-url-browser-function 'browse-url-ariel)

;; ESS SETUP - Got from github

(setq-default ess-dialect "R")
(setq-default inferior-R-args "--no-restore-history --no-save ")

(defadvice ess-eval-buffer (before really-eval-buffer compile activate)
  "Prevent call ess-eval-buffer by accident, frequently by
   hitting C-c C-b instead of C-c C-n."
  (if (yes-or-no-p
       (format "Are you sure you want to evaluate the %s buffer?"
               buffer-file-name))
      (message "ess-eval-buffer started.")
    (error "ess-eval-buffer canceled!")))

(add-hook
 'ess-mode-hook
 '(lambda()
    (ess-toggle-underscore nil)
    (define-key ess-mode-map [?\M--]
      'ess-cycle-assign) ;; `Alt + -'  to cycle `<- | <<- | = ...'.
    (auto-complete-mode 1)
    (company-mode 1)                               ;; (company-mode -1)
    (define-key ess-mode-map (kbd "C-c C-t e") (quote ess-rdired))
    (define-key ess-mode-map [f5] 'company-R-args) ;; F5 do show ARGS.
    (setq ess-indent-with-fancy-comments nil) ;; No indent levels.
    (setq-local comment-add 0)                ;; Single # as default.
    (setq ess-smart-operators t)              ;; Smart comma.
    (setq comint-scroll-to-bottom-on-input t)
    (setq comint-scroll-to-bottom-on-output t)
    (setq comint-move-point-for-output t)))

;; Script and console font lock highlight.
(setq ess-R-font-lock-keywords
      '((ess-R-fl-keyword:modifiers . t)
        (ess-R-fl-keyword:fun-defs . t)
        (ess-R-fl-keyword:keywords . t)
        (ess-R-fl-keyword:assign-ops . t)
        (ess-R-fl-keyword:constants . t)
        (ess-fl-keyword:fun-calls . t)
        (ess-fl-keyword:numbers . t)
        (ess-fl-keyword:operators . t)
        (ess-fl-keyword:delimiters . t)
        (ess-fl-keyword:= . t)
        (ess-R-fl-keyword:F&T . t)))
(setq inferior-R-font-lock-keywords
      '((ess-S-fl-keyword:prompt . t)
        (ess-R-fl-keyword:messages . t)
        (ess-R-fl-keyword:modifiers . t)
        (ess-R-fl-keyword:fun-defs . t)
        (ess-R-fl-keyword:keywords . t)
        (ess-R-fl-keyword:assign-ops . t)
        (ess-R-fl-keyword:constants . t)
        (ess-fl-keyword:matrix-labels . t)
        (ess-fl-keyword:fun-calls . t)
        (ess-fl-keyword:numbers . t)
        (ess-fl-keyword:operators . t)
        (ess-fl-keyword:delimiters . t)
        (ess-fl-keyword:= . t)
        (ess-R-fl-keyword:F&T . t)))

;; Support for markdown


(defun rmd-mode ()
  "ESS Markdown mode for rmd files"
  (interactive)
  (setq load-path
        (append (list "path/to/polymode/" "path/to/polymode/modes/")
                load-path))
  (require 'poly-R)
  (require 'poly-markdown)
  (poly-markdown+r-mode))

;;goto wolfram docs

(defun goto-wolfram-documentation ()
  (interactive)
  (browse-url "https://reference.wolfram.com/language/"))

(defun search-wolfram-documentation ()
  (interactive)
  (browse-url (concat "https://reference.wolfram.com/search/"
                      (concat "?q=" (read-string "What do you want to search for? "))))
  )


 ;; ;; org-bullets
 (use-package org-bullets
   :ensure t)
 (add-hook 'org-mode-hook 'org-bullets-mode)

;;; Some Variables

(setq TeX-view-program-selection
      (quote (
              ((output-dvi has-no-display-manager) "PDF Tools")
              ((output-dvi style-pstricks) "PDF Tools")
              (output-dvi "PDF Tools")
              (output-pdf "PDF Tools")
              (output-html "PDF Tools"))))
(setq bibtex-completion-notes-path "~/coisas/matematicasdavida/minhascoisas/org/pdfnotes.org")
(setq bibtex-completion-pdf-field "nil")

(setq org-modules (quote
   (org-bbdb org-bibtex org-docview org-eww org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m org-notify)))


(setq org-babel-load-languages (quote
                                ((python . t)
                                 (emacs-lisp . t)
                                 (R . t))))

(setq org-ref-default-bibliography (quote
                                    ("~/coisas/matematicasdavida/Livros/library.bib")))
(setq org-ref-get-pdf-filename-function (quote org-ref-get-mendeley-filename))

(setq reftex-default-bibliography (quote
                                            ("~/coisas/matematicasdavida/Livros/library.bib")))

(setq rmh-elfeed-org-files(quote
                           ("~/coisas/matematicasdavida/minhascoisas/org/rssfeeds.org")))

(setq org-todo-keyword-faces (quote
   (("Idea" . "White")
    ("MissingRequirement" . "yellow")
    ("DONE" . "green")
    ("Cancelled" . "forest green")
    ("HugeObstacle" . "red")
    ("TODO" . "magenta"))))
(setq org-habit-preceding-days 7)
(setq org-habit-show-all-today t)
(setq org-habit-show-done-always-green t))



;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-browser-function 'browse-url-ariel)
 '(browse-url-chrome-program
   "/mnt/c/Program\\ Files\\ \\(x86\\)/Google/Chrome/Application/chrome.exe")
 '(elpy-rpc-python-command "python3")
 '(org-agenda-files
   '("~/coisas/matematicasdavida/minhascoisas/org/application.org" "~/coisas/matematicasdavida/minhascoisas/org/personal.org" "~/coisas/matematicasdavida/minhascoisas/org/academic.org"))
 '(org-capture-templates
   '(("a" "Appointment" entry
      (file+olp "~/coisas/matematicasdavida/minhascoisas/org/personal.org" "External Communication" "Appointments")
      "")
     ("r" "Talk to" entry
      (file+olp "~/coisas/matematicasdavida/minhascoisas/org/personal.org" "External Communication" "Talk to")
      "")
     ("b" "Blog idea" entry
      (file+olp "~/coisas/matematicasdavida/minhascoisas/org/application.org" "Build/Improve Website" "Add Content")
      "
" :prepend t)
     ("t" "Task" entry
      (file+headline "~/coisas/matematicasdavida/minhascoisas/org/notes.org" "Captured Tasks")
      "
")
     ("n" "Note" entry
      (file+headline "~/coisas/matematicasdavida/minhascoisas/org/notes.org" "Notespace")
      "
")
     ("p" "Project" entry
      (file+olp "~/coisas/matematicasdavida/minhascoisas/org/notes.org" "Captured Projects")
      "")))
 '(org-modules
   '(org-bbdb org-bibtex org-docview org-eww org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m org-notify))
 '(org-ref-get-pdf-filename-function 'org-ref-get-pdf-filename-helm-bibtex)
 '(org-startup-align-all-tables t)
 '(org-todo-keyword-faces
   '(("Idea" . "White")
     ("MissingRequirement" . "yellow")
     ("DONE" . "green")
     ("Cancelled" . "forest green")
     ("HugeObstacle" . "red")
     ("TODO" . "magenta")))
 ;'(org-trello-current-prefix-keybinding "C-c o")
 '(orgtbl-optimized t)
 '(package-selected-packages
   '(org-pdftools insert-shebang fish-mode company-shell bibtex-completion request-deferred atomic-chrome org-edna powershell web-beautify livid-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js-doc tern coffee-mode org-trello csv-mode magit-section org-ql peg ov org-super-agenda ts ht try org-caldav toml-mode racer pos-tip cargo rust-mode wgrep smex ivy-hydra flyspell-correct-ivy counsel-projectile counsel org-gcal org-bullets orgit org-category-capture org-plus-contrib projectile pkg-info epl flx evil goto-chg undo-tree polymode bind-key packed helm avy helm-core async popup workgroups2 anaphora rainbow-delimiters org-brain elpy highlight-indentation org-ref key-chord ivy lv helm-bibtex parsebib ess-smart-equals ess-R-data-view ctable engine-mode biblio biblio-core swiper elfeed-web elfeed-org elfeed-goodies ace-jump-mode noflet powerline popwin elfeed pdf-tools tablist org-noter zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme flyspell-correct-helm flyspell-correct auto-dictionary wolfram-mode pocket-lib kv ess julia-mode pocket-mode pocket-api gmail-message-mode ham-mode html-to-markdown flymd edit-server yapfify xterm-color smeargle shell-pop pyvenv pytest pyenv-mode py-isort pip-requirements rg-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download multi-term mmm-mode markdown-toc markdown-mode magit-gitflow magit-popup live-py-mode hy-mode dash-functional htmlize helm-pydoc helm-gitignore helm-company gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy evil-magit magit transient git-commit with-editor eshell-z eshell-prompt-extras esh-help ein skewer-mode deferred request websocket js2-mode simple-httpd disaster cython-mode company-statistics company-c-headers company-auctex company-anaconda company cmake-mode clang-format auctex-latexmk auctex anaconda-mode pythonic f dash s ac-ispell auto-complete which-key use-package pcre2el macrostep hydra helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag exec-path-from-shell evil-visualstar evil-escape elisp-slime-nav diminish bind-map auto-compile ace-window ace-jump-helm-line))
 '(rmh-elfeed-org-files
   '("~/coisas/matematicasdavida/minhascoisas/org/rssfeeds.org") t)
 '(wolfram-path "/mnt/c/Ariel/")
 '(wolfram-program
   "/mnt/c/Program-Files/Wolfram-Research/Mathematica/12.0/math.exe")
 '(wolfram-program-2
   "/mnt/c/Program-Files/Wolfram-Research/Mathematica/12.0/math.exe"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 2.0))))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(blink-cursor-mode nil)
 '(browse-url-browser-function (quote browse-url-ariel))
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(display-battery-mode t)
 '(evil-want-Y-yank-to-eol nil)
 '(font-use-system-font t)
 '(global-tab-line-mode nil)
 '(mu4e-attachment-dir "/mnt/c/Ariel/Desktop")
 '(mu4e-user-mail-address-list (quote ("arielserranoni@gmail.com" "ariel@ime.usp.br")))
 '(org-babel-python-command "python3")
 '(org-babel-results-keyword "OUTPUT")
 '(org-bullets-bullet-list (quote ("✸" "►" "◉" "✿" "◇" "○")))
 '(org-file-apps
   (quote
    ((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . browse-url-ariel)
     ("\\.pdf\\'" . emacs))))
 '(org-trello-current-prefix-keybinding "C-c o" nil (org-trello))
 '(package-selected-packages
   (quote
    (company-tabnine unicode-escape names mu4e-maildirs-extension mu4e-alert py-yapf org-repo-todo jade-mode helm-pydoc helm-gitignore helm-css-scss helm-company helm-c-yasnippet company-racer company-quickhelp window-numbering smooth-scrolling leuven-theme ido-vertical-mode buffer-move bracketed-paste quelpa package-build powershell arduino-mode page-break-lines workgroups emoji-github toml-mode racer pos-tip cargo rust-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode haml-mode emmet-mode company-web web-completion-data counsel-tramp ht mixed-pitch cl-lib ws-butler winum volatile-highlights vi-tilde-fringe uuidgen toc-org spaceline restart-emacs persp-mode paradox spinner org-plus-contrib open-junk-file neotree move-text lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode helm-themes helm-swoop helm-projectile helm-mode-manager helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-ediff evil-args evil-anzu anzu eval-sexp-fu dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol aggressive-indent adaptive-wrap ace-link ace-jump-helm-line yapfify xterm-color workgroups2 wolfram-mode which-key wgrep use-package smex smeargle shell-pop rainbow-delimiters pytest pyenv-mode py-isort pip-requirements pcre2el orgit org-trello request-deferred org-ref pdf-tools key-chord tablist org-present org-pomodoro alert log4e gntp org-noter org-mime org-download org-bullets org-brain multi-term mmm-mode markdown-toc markdown-mode magit-gitflow magit-popup macrostep live-py-mode ivy-hydra insert-shebang hydra lv hy-mode dash-functional htmlize helm-make helm-bibtex helm bibtex-completion parsebib helm-core gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flx fish-mode evil-visualstar evil-magit magit git-commit transient evil-escape evil goto-chg undo-tree ess-smart-equals ess-R-data-view ctable ess eshell-z eshell-prompt-extras esh-help engine-mode elpy pyvenv highlight-indentation elisp-slime-nav elfeed-web simple-httpd elfeed-org elfeed-goodies ace-jump-mode noflet powerline popwin elfeed ein with-editor exec-path-from-shell polymode deferred request anaphora websocket disaster diminish cython-mode csv-mode counsel-projectile projectile pkg-info epl counsel swiper ivy company-statistics company-shell company-c-headers company-auctex company-anaconda company cmake-mode clang-format bind-map bind-key biblio biblio-core auto-yasnippet yasnippet auto-compile packed auctex-latexmk auctex async anaconda-mode pythonic f dash s ace-window avy ac-ispell auto-complete popup)))
 '(python-shell-interpreter "python3")
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587)
 '(tab-bar-close-button-show nil)
 '(tab-bar-show nil)
 '(wolfram-path "/mnt/c/Users/Ariel")
 '(wolfram-program
   "\"/mnt/c/Program-Files/Wolfram-Research/Mathematica/12.0/math.exe\""))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 2.0))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
