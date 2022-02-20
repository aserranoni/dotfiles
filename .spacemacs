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
   dotspacemacs-enable-lazy-installation 'all

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
     javascript
     yaml
     windows-scripts
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ivy
     auto-completion
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
     twitter
     markdown
     ipython-notebook
     (python :variables python-backend 'lsp python-enable-yapf-format-on-save t python-sort-imports-on-save t)
     shell
     (org :variables
         org-agenda-files '("~/coisas/matematicasdavida/minhascoisas/org/academic.org"
                             "~/coisas/matematicasdavida/minhascoisas/org/personal.org"
                             "~/coisas/matematicasdavida/minhascoisas/org/application.org"))
     themes-megapack

     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      dired-git-info
                                      dired-icon
                                      all-the-icons-ivy-rich
                                      doom-modeline
                                      workgroups2
                                      avy
                                      swiper
                                      pact-mode
                                      solidity-mode
                                      tramp
                                      company-tabnine
                                      ace-window
                                      wolfram-mode
                                      neotree
                                      org-roam
                                      undo-tree
                                      ivy-rich
                                      org-bullets
                                      org-brain
                                      org-noter
                                      org-edna
                                      org-superstar
                                      org-super-agenda
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
                                    ess-R-object-popup
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
   dotspacemacs-editing-style 'hybrid

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
   dotspacemacs-frame-title-format "%a@%m"

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

  ;; supress package cl deprecated warning at startup

  (setq byte-complile-warnings '(not cl-functions)))

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

(org-babel-load-file (expand-file-name "~/spacemacs-user-config.org"))

)



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
 ;; If there is more than on, they won't work right.
 '(package-selected-packages
   '(org-pdftools insert-shebang fish-mode company-shell bibtex-completion request-deferred atomic-chrome org-edna powershell web-beautify livid-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js-doc tern coffee-mode csv-mode magit-section org-ql peg ov org-super-agenda ts ht try org-caldav toml-mode racer pos-tip cargo rust-mode wgrep smex ivy-hydra flyspell-correct-ivy counsel-projectile counsel org-gcal org-bullets orgit org-category-capture org-plus-contrib projectile pkg-info epl flx evil goto-chg undo-tree polymode bind-key packed helm avy helm-core async popup workgroups2 anaphora rainbow-delimiters org-brain elpy highlight-indentation org-ref key-chord ivy lv helm-bibtex parsebib ess-smart-equals ess-R-data-view ctable engine-mode biblio biblio-core swiper elfeed-web elfeed-org elfeed-goodies ace-jump-mode noflet powerline popwin elfeed pdf-tools tablist org-noter zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme flyspell-correct-helm flyspell-correct auto-dictionary wolfram-mode pocket-lib kv ess julia-mode pocket-mode pocket-api gmail-message-mode ham-mode html-to-markdown flymd edit-server yapfify xterm-color smeargle shell-pop pyvenv pytest pyenv-mode py-isort pip-requirements rg-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download multi-term mmm-mode markdown-toc markdown-mode magit-gitflow magit-popup live-py-mode hy-mode dash-functional htmlize helm-pydoc helm-gitignore helm-company gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy evil-magit magit transient git-commit with-editor eshell-z eshell-prompt-extras esh-help ein skewer-mode deferred request websocket js2-mode simple-httpd disaster cython-mode company-statistics company-c-headers company-auctex company-anaconda company cmake-mode clang-format auctex-latexmk auctex anaconda-mode pythonic f dash s ac-ispell auto-complete which-key use-package pcre2el macrostep hydra helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag exec-path-from-shell evil-visualstar evil-escape elisp-slime-nav diminish bind-map auto-compile ace-window ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 2.0))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(org-link ((t (:foreground "#2aa1ae" :underline t :family "Monospace"))))
 '(org-ref-cite-face ((t (:inherit org-link :foreground "cyan"))))
 '(org-table ((t (:background "#293239" :foreground "#b2b2b2" :family "Monospace"))))
 '(tab-bar ((t (:inherit variable-pitch :extend t :background "dark cyan" :distant-foreground "lawn green" :foreground "gray11" :inverse-video t :underline nil :slant italic :weight semi-light :height 0.9 :width normal)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3f3f3f" "#ea3838" "#7fb07f" "#fe8b04" "#62b6ea" "#e353b9" "#1fb3b3" "#d5d2be"])
 '(avy-all-windows 'all-frames)
 '(aw-scope 'visible)
 '(background-color "#202020")
 '(background-mode dark)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(cursor-color "#cccccc")
 '(custom-safe-themes
   '("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "e7ba99d0f4c93b9c5ca0a3f795c155fa29361927cadb99cfce301caf96055dfd" default))
 '(diary-entry-marker 'font-lock-variable-name-face)
 '(doom-modeline-buffer-file-name-style 'relative-to-project)
 '(elpy-rpc-python-command "python3")
 '(emms-mode-line-icon-color "#1fb3b3")
 '(evil-undo-system 'undo-tree)
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#FFFFF8")
 '(foreground-color "#cccccc")
 '(gnus-logo-colors '("#528d8d" "#c0c0c0") t)
 '(gnus-mode-line-image-cache
   '(image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #1fb3b3\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };") t)
 '(ivy-display-style nil)
 '(ivy-sort-max-size 30)
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(org-superstar-remove-leading-stars t)
 '(package-selected-packages
   '(pact-mode switch-window solidity-mode alarm-clock magit-section emacsql-sqlite dash org-roam dash-functional anaconda-mode pythonic emoji-display ivy-emoji pos-tip rust-mode markdown-mode md4rd proof-general selectric-mode 2048-game pacmacs sudoku typit mmt xkcd emoji-cheat-sheet-plus company-emoji evil-surround eyebrowse imenu-list ranger chinese-wbim fcitx find-by-pinyin-dired ace-pinyin pinyinlib pangu-spacing youdao-dictionary chinese-word-at-point floobits graphviz-dot-mode bundler chruby enh-ruby-mode evil-matchit ggtags helm-gtags minitest rbenv robe rspec-mode rubocop ruby-test-mode ruby-tools rvm geiser ahk-mode helm-css-scss psci purescript-mode psc-ide scala-mode sbt-mode company-go flycheck-gometalinter go-eldoc go-guru go-mode flycheck-rust auto-highlight-symbol common-lisp-snippets slime-company slime ob-sml sml-mode srefactor company-ycmd helm-cscope stickyfunc-enhance xcscope swift-mode plantuml-mode glsl-mode company-glsl sql-indent drupal-mode php-extras php-mode phpunit company-emacs-eclim eclim vimrc-mode dactyl-mode cider-eval-sexp-fu clj-refactor cider sesman queue parseedn parseclj a clojure-mode clojure-snippets arduino-mode julia-mode matlab-mode qml-mode scad-mode stan-mode thrift vmd-mode nasm-mode x86-lookup elm-mode reformatter flycheck-elm tide typescript-mode flycheck-nim nim-mode flycheck-nimsuggest commenter epc concurrent coffee-mode js-doc js2-refactor multiple-cursors tern web-beautify livid-mode skewer-mode js2-mode idris-mode prop-menu golden-ratio helm-pydoc lua-mode company-quickhelp racket-mode company-dcd d-mode flycheck-dmd-dub merlin ocp-indent tuareg caml utop typo adoc-mode markup-faces omnisharp csharp-mode tree-sitter-langs tree-sitter-indent tree-sitter tsc erlang cmm-mode company-cabal company-ghci flycheck-haskell haskell-mode haskell-snippets helm-hoogle hindent hlint-refactor faust-mode alchemist elixir-mode flycheck-credo ob-elixir fsharp-mode ibuffer-projectile org-projectile org-category-capture ox-twbs ox-gfm ox-reveal persp-mode mwim unfill evil-snipe vi-tilde-fringe diff-hl evil-cleverparens paredit evil-commentary evil-nerd-commenter color-identifiers-mode rainbow-identifiers rainbow-mode auto-dictionary flyspell-correct-ivy flyspell-correct-helm flyspell-correct-popup flyspell-correct flyspell-popup flycheck-pos-tip helm-company helm-c-yasnippet ace-jump-helm-line helm-ag helm-descbinds helm-flx helm-mode-manager helm-projectile helm-swoop helm-themes docker json-mode json-snatcher json-reformat docker-tramp dockerfile-mode systemd pandoc-mode ox-pandoc puppet-mode osx-location rase sunshine theme-changer deft spray company-restclient know-your-http-well ob-http ob-restclient restclient-helm restclient ansible ansible-doc company-ansible jinja2-mode rebox2 zeal-at-point helm-dash counsel-dash dash-docs prodigy nginx-mode fasd edit-server gmail-message-mode ham-mode html-to-markdown flymd flycheck-ycmd ycmd request-deferred vagrant vagrant-tramp flycheck-ledger flycheck ledger-mode salt-mode mmm-jinja2 yaml-mode command-log-mode terraform-mode hcl-mode launchctl osx-dictionary osx-trash pbcopy reveal-in-osx-finder company-nixos-options helm-nixos-options nix-mode nixos-options ace-link flx-ido open-junk-file paradox spinner restart-emacs winum define-word google-translate fancy-battery fill-column-indicator hl-todo spaceline toc-org evil-anzu anzu evil-args evil-ediff evil-exchange evil-iedit-state iedit evil-indent-plus evil-lisp-state smartparens evil-mc evil-numbers evil-search-highlight-persist highlight evil-tutor evil-unimpaired evil-visual-mark-mode linum-relative adaptive-wrap column-enforce-mode highlight-numbers parent-mode highlight-parentheses hl-anything indent-guide volatile-highlights dumb-jump aggressive-indent bracketed-paste clean-aindent-mode eval-sexp-fu expand-region hungry-delete link-hint lorem-ipsum move-text origami uuidgen ws-butler wakatime-mode spotify helm-spotify multi geeknote rcirc-color rcirc-notify slack emojify oauth2 erc-gitter erc-hl-nicks erc-image erc-social-graph erc-view-log erc-yt jabber srv fsm gist github-browse-file github-clone github-search magit-gh-pulls gh marshal logito pcache helm-gitignore p4 git-gutter-fringe git-gutter git-gutter-fringe+ fringe-helper git-gutter+ nlinum-relative nlinum feature-mode projectile-rails rake inf-ruby inflections pony-mode mw-thesaurus yasnippet-snippets ivy-yasnippet yasnippet-classic-snippets org-superstar org-super-agenda ts org-edna twittering-mode vuiet circe dired-git-info dired-icon zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme all-the-icons-ivy-rich ivy-bibtex yapfify xterm-color workgroups2 wolfram-mode which-key wgrep web-mode use-package undo-tree toml-mode tagedit smex smeargle slim-mode shell-pop scss-mode sass-mode rainbow-delimiters racer pytest pyenv-mode py-isort pug-mode powershell pip-requirements pcre2el orgit org-ref org-present org-pomodoro org-noter org-download org-bullets org-brain neotree multi-term mu4e-maildirs-extension mu4e-alert mmm-mode markdown-toc magit-gitflow macrostep live-py-mode ivy-rich ivy-hydra insert-shebang hy-mode helm-make gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flx fish-mode exec-path-from-shell evil-visualstar evil-magit evil-escape ess-smart-equals ess-R-data-view eshell-z eshell-prompt-extras esh-help engine-mode emmet-mode elpy elisp-slime-nav elfeed-web elfeed-org elfeed-goodies ein doom-modeline disaster diminish cython-mode csv-mode counsel-projectile company-web company-tabnine company-statistics company-shell company-c-headers company-auctex company-anaconda cmake-mode clang-format cargo bind-map auto-yasnippet auto-compile auctex-latexmk ace-window ac-ispell))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(python-shell-interpreter "python3")
 '(switch-window-multiple-frames t)
 '(thesaurus-bhl-api-key "4d80bbd4d3d479d2ac5bb425ea9687e6")
 '(vc-annotate-background "#FFFFFD")
 '(vc-annotate-color-map
   '((20 . "#D5D2C8")
     (40 . "#B0ADA2")
     (60 . "#B0ADA2")
     (80 . "#737063")
     (100 . "#737063")
     (120 . "#4E4B3D")
     (140 . "#4E4B3D")
     (160 . "#373426")
     (180 . "#373426")
     (200 . "#373426")
     (220 . "#292617")
     (240 . "#292617")
     (260 . "#292617")
     (280 . "#201D0E")
     (300 . "#201D0E")
     (320 . "#201D0E")
     (340 . "#1B1809")
     (360 . "#1B1809")))
 '(vc-annotate-very-old-color "#4E4B3D"))
