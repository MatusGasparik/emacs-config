;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
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
     ;; private layers
     my-conf
     ;; protobuf
     markdown
     ;; moom
     ;; markdown
     ;; javascript
     ;; (julia :variables
     ;;        julia-executable "/usr/local/bin/julia")
     ;; vimscript
     yaml
     ;; csv
     clojure
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            c-c++-enable-clang-support t)
     docker
     html
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-complete-with-key-sequence-delay 1
                      auto-completion-private-snippets-directory nil
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t
                      )
     ;; better-defaults
     bibtex
     pdf-tools
     common-lisp
     ;; emacs-lisp
     git
     (go :variables
         gofmt-command "goimports"
         go-tab-width 4
         go-use-gometalinter t)
     ;; markdown
     (latex :variables
            latex-enable-auto-fill t
            latex-enable-folding t
            )
     (mu4e :variables
           mu4e-enable-notifications t
           mu4e-enable-mode-line t
           mu4e-installation-path "/usr/local/Cellar/mu/0.9.18_1/share/emacs/site-lisp/mu/mu4e/"
           )
     (org :variables
          org-enable-reveal-js-support t
          )
     (shell :variables
            shell-default-shell 'ansi-term
            shell-default-term-shell "/usr/local/bin/zsh"
            shell-default-position 'right
            shell-default-full-span nil
            )
     slack
     (python :variables
             python-enable-yapf-format-on-save t
             python-fill-column 88
             python-sort-imports-on-save t
             python-test-runner 'pytest)
     (ipython-notebook)
     (spell-checking :variables
                     enable-flyspell-auto-completion t
                     spell-checking-enable-by-default nil
                     spell-checking-enable-auto-dictionary t)
     syntax-checking
     (osx  :variables
           mac-right-option-modifier nil)
     w3m
     ;; version-control
     ;; themes-megapack
     ;; dash ;; http://spacemacs.org/layers/+tools/dash/README.html
     evil-commentary ;; http://spacemacs.org/layers/+vim/evil-commentary/README.html
     vim-powerline
     ;; evernote ;; http://spacemacs.org/layers/+web-services/evernote/README.html
     xkcd ;; http://spacemacs.org/layers/+fun/xkcd/README.html
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      auctex-latexmk
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages
   '(
     ;; disabled so that global auto complete can be enabled
     ;; company
     )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; A list of packages that will not be installed and loaded.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https nil
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
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
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((todos . 10)
                                (projects . 5))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight regular
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
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
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
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
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
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
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
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
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setenv "WORKON_HOME" "~/miniconda3/envs")
  ;;(shell-command "source ~/.bash_profile")
  ;; (setq inferior-lisp-program "/usr/local/bin/sbcl")
  )


(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (display-time-mode 1)

  ;; custom keys
  (spacemacs/set-leader-keys "=" 'calculator)
  (global-set-key (kbd "s-<return>") 'toggle-frame-fullscreen) ;; cmd-enter
  (spacemacs/set-leader-keys "o" 'occur)

  ;;; slack
  ;; load credentials for slack
  (load-library "~/.emacs.d/private/slack-auth.el.gpg")
  ;; key bindings
  (evil-define-key 'normal slack-mode-map
    ",ra" 'slack-message-add-reaction
    ",rr" 'slack-message-remove-reaction
    ",rs" 'slack-message-show-reaction-users
    ",pl" 'slack-room-pins-list
    ",pa" 'slack-message-pins-add
    ",pr" 'slack-message-pins-remove
    ",mm" 'slack-message-write-another-buffer
    ",me" 'slack-message-edit
    ",md" 'slack-message-delete
    ",jc" 'slack-channel-select
    ",jd" 'slack-im-select
    ",2" 'slack-message-embed-mention
    ",3" 'slack-message-embed-channel
    "\C-n" 'slack-buffer-goto-next-message
    "\C-p" 'slack-buffer-goto-prev-message)
  (evil-define-key 'normal slack-edit-message-mode-map
    ",k" 'slack-message-cancel-edit
    ",s" 'slack-message-send-from-buffer
    ",2" 'slack-message-embed-mention
    ",3" 'slack-message-embed-channel)

  ;; windmove fast buffer switching
  (global-set-key (kbd "s-<up>") 'windmove-up)
  (global-set-key (kbd "s-<down>") 'windmove-down)
  (global-set-key (kbd "s-<right>") 'windmove-right)
  (global-set-key (kbd "s-<left>") 'windmove-left)

  ;; kill shell bufer after exit
  (defun ansi-term-handle-close ()
    "Close current term buffer when `exit' from term buffer."
    (when (ignore-errors (get-buffer-process (current-buffer)))
      (set-process-sentinel (get-buffer-process (current-buffer))
                            (lambda (proc change)
                              (when (string-match "\\(finished\\|exit\\)" change)
                                (kill-buffer (process-buffer proc))
                                (delete-window))))))
  (add-hook 'shell-mode-hook 'ansi-term-handle-close)

  ;; make calculator insert the result upot hitting C-Enter
  (defadvice calculator-save-and-quit (after yank-answer activate) (yank))

  ;; system
  (add-to-list 'exec-path "/usr/local/bin")

  ;; global auto-completion
  ;; (global-company-mode)

  ;; auto-fill by default for a specific mode
  (add-hook 'org-mode-hook 'turn-on-auto-fill)
  ;; (add-hook 'org-mode-hook (lambda () (setq fill-column 100)))

  ;; auto-fill for all major modes
  (setq-default auto-fill-function 'do-auto-fill)

  ;; User
  (setq user-mail-address "matus.gasparik@gmail.com"
        user-full-name "Matus Gasparik")

  ;; LaTeX
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)

  ;; org-mode
  ;; make yas work well with org-mode
  (add-hook 'org-mode-hook
            (lambda ()
              (setq company-backends '((company-yasnippet company-dabbrev)))))

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((dot    . t)
     (shell  . t)
     (C      . t)
     (python . t)
     (lisp   . t)
     (sqlite . t)
     (latex  . t)
     ))


  ;; make latex preview fragments larger
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.5))

  (setq org-agenda-files (list "/Users/matus/Dropbox/ORG/HOME"
                               "/Users/matus/Dropbox/ORG/org-share"
                               "/Users/matus/Dropbox/ORG/org-share/ML-DL"
                               "/Users/matus/Dropbox/ORG/Moje")
        org-default-notes-file "/Users/matus/Dropbox/ORG/Moje/agenda.org"
        org-startup-indented t
        org-log-done 'time
        org-agenda-include-diary t
        org-startup-indented t
        org-src-ask-before-returning-to-edit-buffer nil
        org-confirm-babel-evaluate nil
        org-src-fontify-natively t
        org-refile-targets '(
                             (nil :maxlevel . 3)
                             (org-agenda-files :maxlevel . 3))
        )

  ;; ToDo keywords
  (setq org-todo-keywords (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
                                  (sequence "KAUFEN(k)" "|" "GEKAUFT(K@!)")
                                  (sequence "APPLY(a)" "WAITING(w@/!)" "OFFER(o@!)" "|" "REJECTION(r@!)")
                                  (sequence "SOMEDAY(s)"  "|" "CANCELED(c@)" ))))

  ;; Set custom colors for ToDo states
  (setq org-todo-keyword-faces
        '(("TODO" . (:foreground "GoldenRod" :weight bold))
          ("NEXT" . (:foreground "OrangeRed" :weight bold))
          ("DONE" . (:foreground "#618685" :weight bold))
          ("WAITING" . (:foreground "coral" :weight bold))
          ("CANCELED" . (:foreground "LimeGreen" :weight bold))
          ("SOMEDAY" . (:foreground "LimeGreen" :weight bold))
          ))

  ;; (add-to-list 'org-emphasis-alist
  ;;              '("*" (:foreground "#FF6347" :weight bold)
  ;;                ))
  
  (setq org-capture-templates
        '(("t" "ToDo" entry (file+headline "/Users/matus/Dropbox/ORG/Moje/agenda.org" "INBOX")
           "* TODO %?\n  %i\n  %a")

          ("T" "HOME ToDo" entry (file+headline "/Users/matus/Dropbox/ORG/HOME/HomeOrganizer.org" "AUFGABEN")
           "* TODO %? \nSCHEDULED:%^T\n")

          ("K" "EINKAUFEN" entry (file+headline "/Users/matus/Dropbox/ORG/HOME/HomeOrganizer.org" "EINKÄUFE")
           "* KAUFEN [/]\n- [ ] %?")

          ("r" "Respond" entry (file+headline "/Users/matus/Dropbox/ORG/Moje/agenda.org" "INBOX")
           "* NEXT Reply to %:from on %:subject :email:\nSCHEDULED: <%(org-read-date nil nil \"+1d\")>\n%U\n%a\n" :immediate-finish t)

          ("H" "Job Hunt" entry (file+headline
           "/Users/matus/Dropbox/ORG/Moje/jobs.org" "JOB HUNT")
           "* APPLY at %^{Company/Institution name} :job:
:PROPERTIES:
:DESCRIPTION: %^{Description}p
:LOCATION: %^{Location}
:OPEN-POSSITION: %^{Open positions?|y|n|?}
:URL: %^{url}
:CONTACT: %^{Contact person}
:APPLIED:
:END:

%t

*NOTES*\n%?")


          ("l" "Add to LINKS" entry (file+headline "/Users/matus/Dropbox/ORG/org-share/links.org" "refile")
           "* %?\n- [[%^{Link}][%^{Description}]]\n")

          ("p" "Phone call" entry (file+headline "/Users/matus/Dropbox/ORG/Moje/jobs.org" "Phone calls")
           "* %? :phone:
:PROPERTIES:
:CONTACT-PERSON: %^{Contact person}
:DATE: %U
:PHONE-NO: %^{Phone-no.}
:END:

*NOTE:* ")
          ))

  ;; Custom SRC block templates
  (add-to-list 'org-structure-template-alist
               '("cpp" "#+BEGIN_SRC C++ :results output verbatim\n?\n#+END_SRC\n" "<src lang=\"?\">\n\n</src>"))
  (add-to-list 'org-structure-template-alist
               '("c" "#+BEGIN_SRC C :results output verbatim\n?\n#+END_SRC\n" "<src lang=\"?\">\n\n</src>"))
  (add-to-list 'org-structure-template-alist
              '("py" "#+BEGIN_SRC python :results output\n?\n#+END_SRC\n" "<src lang=\"?\">\n\n</src>"))
  (add-to-list 'org-structure-template-alist
               '("sh" "#+BEGIN_SRC bash :results output\n?\n#+END_SRC\n" "<src lang=\"?\">\n\n</src>"))
  (add-to-list 'org-structure-template-alist
               '("m" "\\begin{equation}\n?\n\\end{equation}"))
  (add-to-list 'org-structure-template-alist
               '("mu" "\\begin{*equation}\n?\n\\end{*equation}"))
  (add-to-list 'org-structure-template-alist
               '("mi" "\\( \? \\)"))

  ;; Tags with fast selection keys
  (setq org-tag-alist (quote (("read" . ?r)
                              ("code" . ?c)
                              ("phone" . ?p)
                              ("personal" . ?m)
                              (:startgroup)
                              ("@home" . ?H)
                              ("@office" . ?O)
                              ("@city" . ?C)
                              (:endgroup)
                              ;; ("phone" . ?t)
                              ;; ("email" . ?e)
                              ;; ("personal" . ?p)
                              ;; ("code" . ?c)
                              ;; ("job" . ?j)
                              ;; ("meeting" . ?m)
                              ;; ("family" . ?f)
                              ;; ("note" . ?n)
                              )))

  ;; BibTeX
  (setq reftex-default-bibliography '("/Users/matus/Dropbox/ORG/org-share/BibTeX_files/Matus/library.bib"))
  (setq org-ref-default-bibliography '("/Users/matus/Dropbox/ORG/org-share/BibTeX_files/Matus/library.bib")
        org-ref-bibliography-notes "/Users/matus/Dropbox/ORG/org-share/BibTeX_files/Matus/references.org"
        org-ref-pdf-directory "/Users/matus/Dropbox/ORG/org-share/BibTeX_files/Matus/PDFs"
        bibtex-completion-pdf-field "file"
        bibtex-completion-bibliography "/Users/matus/Dropbox/ORG/org-share/BibTeX_files/Matus/library.bib"
        bibtex-completion-library-path "/Users/matus/Dropbox/ORG/org-share/BibTeX_files/Matus/PDFs"
        ;; helm-bibtex-bibliography '("/Users/matus/Dropbox/ORG/org-share/BibTeX_files/Matus/library.bib")
        ;; helm-bibtex-library-path '("/Users/matus/Dropbox/ORG/org-share/BibTeX_files/Matus/PDFs")
        )

  ;; w3m for web browsing
  (defun dotspacemacs/user-config ()
  (setq w3m-home-page "https://www.google.com")
  ;; W3M Home Page
  (setq w3m-default-display-inline-images t)
  (setq w3m-default-toggle-inline-images t)
  ;; W3M default display images
  (setq w3m-command-arguments '("-cookie" "-F"))
  (setq w3m-use-cookies t)
  ;; W3M use cookies
  (setq browse-url-browser-function 'w3m-browse-url)
  ;; Browse url function use w3m
  (setq w3m-view-this-url-new-session-in-background t)
  W3M view url new session in background
  )

  ;; mu4e
  ;; tell mu4e how to sync email
  (setq mu4e-get-mail-command "mbsync -a"
        mu4e-attachment-dir  "~/Downloads"
        mu4e-update-interval 120
        mu4e-compose-signature-auto-include nil
        mu4e-compose-complete-addresses t
        mu4e-view-show-images t
        mu4e-view-image-max-width 800
        mu4e-view-show-addresses t
        mu4e-compose-dont-reply-to-self t
        mu4e-html2text-command "w3m -dump -T text/html"
        mu4e-sent-messages-behavior 'delete
        mu4e-compose-dont-reply-to-self t
        mu4e-index-cleanup nil      ;; don't do a full cleanup check
        mu4e-index-lazy-check t ;; don't consider up-to-date dirs
        org-mu4e-link-query-in-headers-mode t) ;; link to the query in headers view

  ;; Use imagemagick, if available.
  (when (fboundp 'imagemagick-register-types)
    (imagemagick-register-types))

  ;; behavior while composing
  (add-hook 'mu4e-compose-mode-hook
            (defun my-do-compose-stuff ()
            "My settings for message composition."
            (set-fill-column 72)
            (flyspell-mode)))

  ;; add cc header
  (add-hook 'mu4e-compose-mode-hook
            (defun my-add-cc ()
              "Add a cc-header"
              (save-excursion (message-add-header "Cc: \n"))))

  ;; Iso-date format
  (setq mu4e-headers-date-format "%d.%m.%Y %H:%M")

  ;; header fields
  (setq mu4e-headers-fields
        '( (:date . 20)
           (:flags . 6)
           (:from . 50)
           (:subject . nil)))

  (setq
   mu4e-maildir       "~/.maildir/gmail"   ;; top-level Maildir
   mu4e-sent-folder   "/.All Mail"       ;; folder for sent messages
   mu4e-drafts-folder "/.Drafts"     ;; unfinished messages
   mu4e-trash-folder  "/.Trash")      ;; trashed messages

  (setq mu4e-bookmarks `(("date:today..now" "Today's messages" ?t)
                         ("date:7d..now" "Last 7 days" ?w)
                         ("mime:image/*" "Messages with images" ?p)
                         ("flag:flagged" "Flagged messages" ?f)
                         (,(concat "flag:unread AND "
                                   "NOT flag:trashed AND "
                                   "NOT maildir:/[Gmail].Spam AND "
                                   "NOT maildir:/[Gmail].Trash")
                          "Unread messages" ?u)))

  ;; ;;; Mail directory shortcuts
  (setq mu4e-maildir-shortcuts
        '(("/.All Mail" . ?i)
          ("/.Spam" . ?s)
          ("/.Trash" . ?t)
          ("/.Drafts" . ?d)))

  (add-hook 'mu4e-mark-execute-pre-hook
            (lambda (mark msg)
              (cond ((equal mark 'refile) (mu4e-action-retag-message msg "-\\Inbox"))
                    ((equal mark 'trash) (mu4e-action-retag-message msg "-\\Inbox,-\\Starred"))
                    ((equal mark 'flag) (mu4e-action-retag-message msg "-\\Inbox,\\Starred"))
                    ((equal mark 'unflag) (mu4e-action-retag-message msg "-\\Starred")))))

  ;;; msmtp
  (setq message-send-mail-function 'message-send-mail-with-sendmail
        sendmail-program "msmtp"
        message-sendmail-extra-arguments '("--read-envelope-from")
        message-sendmail-f-is-evil 't
        message-sendmail-extra-arguments '("-C" "/Users/matus/.spacemacs.d/msmtprc" "-a" "gmail"))

  (with-eval-after-load 'mu4e-alert
    ;; Enable Desktop notifications
    (mu4e-alert-set-default-style 'notifier))   ; For Mac OSX (through the terminal notifier app)

  ;; start agenda at startup
  (org-agenda-list)
  (switch-to-buffer "*Org Agenda*")
  (spacemacs/toggle-maximize-buffer)

  ;; start the server
  (server-start)
  )
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anzu-cons-mode-line-p nil)
 '(anzu-mode-line-update-function (quote spacemacs/anzu-update-mode-line))
 '(global-hl-line-mode t)
 '(global-page-break-lines-mode t)
 '(helm-display-header-line nil)
 '(helm-echo-input-in-header-line t)
 '(ispell-program-name "/usr/local/bin/aspell")
 '(org-agenda-files
   (quote
    ("/Users/matus/Dropbox/ORG/HOME/HomeOrganizer.org" "/Users/matus/Dropbox/ORG/org-share/cheatsheet.org" "/Users/matus/Dropbox/ORG/org-share/cluster-usage.org" "/Users/matus/Dropbox/ORG/org-share/learning-plan.org" "/Users/matus/Dropbox/ORG/org-share/python-datascience-notes.org" "/Users/matus/Dropbox/ORG/Moje/Notes.org" "/Users/matus/Dropbox/ORG/Moje/costs.org" "/Users/matus/Dropbox/ORG/Moje/productivity.org")))
 '(org-emphasis-alist
   (quote
    (("*" bold)
     ("/"
      (nil red))
     ("_" underline)
     ("=" org-verbatim verbatim)
     ("~" org-code verbatim)
     ("+"
      (:strike-through t)))))
 '(org-fontify-done-headline t)
 '(org-hide-emphasis-markers t)
 '(org-hide-leading-stars t)
 '(org-startup-with-inline-images t)
 '(org-tags-column -100)
 '(package-selected-packages
   (quote
    (clojure-snippets clj-refactor inflections edn paredit peg cider-eval-sexp-fu cider sesman seq queue clojure-mode interleave go-guru go-eldoc flycheck-gometalinter company-go go-mode slack emojify circe oauth2 company-quickhelp xkcd evil-commentary focus orgit org-present moom org-mime julia-repl julia-mode flycheck-julia dockerfile-mode docker docker-tramp disaster company-c-headers cmake-mode clang-format slime-company slime common-lisp-snippets ranger mmm-mode markdown-toc markdown-mode gh-md web-beautify livid-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js-doc company-tern dash-functional tern coffee-mode vimrc-mode dactyl-mode ein skewer-mode request-deferred websocket deferred js2-mode simple-httpd yaml-mode ox-reveal helm-w3m w3m csv-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data auctex-latexmk mu4e-maildirs-extension mu4e-alert ht flyspell-popup xterm-color shell-pop org-ref pdf-tools key-chord ivy tablist multi-term helm-bibtex parsebib eshell-z eshell-prompt-extras esh-help biblio biblio-core company-auctex auctex yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic smeargle magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit with-editor reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl org-projectile org-pomodoro alert log4e gntp org-download htmlize helm-company helm-c-yasnippet gnuplot fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck company-statistics company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async evil-unimpaired f s dash)))
 '(paradox-github-token t)
 '(spaceline-helm-mode t)
 '(spaceline-info-mode t)
 '(winum-auto-setup-mode-line nil)
 '(x-underline-at-descent-line t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bold ((t (:foreground "dark khaki" :weight bold))))
 '(hl-line ((t (:background "#212026"))))
 '(org-block ((t (:background "gray8" :foreground "#cbc1d5"))))
 '(org-block-begin-line ((t (:background "gray30" :foreground "gray65"))))
 '(org-block-end-line ((t (:background "gray30" :foreground "gray65"))))
 '(org-date ((t (:foreground "#878f99"))))
 '(org-default ((t (:inherit default))))
 '(org-headline-done ((t (:foreground "gray40"))))
 '(org-level-1 ((t (:inherit bold :foreground "gray100" :height 1.2))))
 '(org-level-2 ((t (:inherit bold :foreground "#70CFF5" :height 1.2))))
 '(org-level-3 ((t (:foreground "#30B4E8" :weight normal :height 1.1))))
 '(org-level-4 ((t (:foreground "#1186B0" :weight normal))))
 '(org-level-5 ((t (:foreground "#3764B9" :weight normal))))
 '(org-level-8 ((t (:foreground "gray100" :weight bold))))
 '(org-link ((t (:foreground "dark cyan"))))
 '(org-table ((t (:inherit default :background "gray100" :foreground "gray40"))))
 '(org-verbatim ((t (:foreground "#FF6347" :weight semi-bold)))))
