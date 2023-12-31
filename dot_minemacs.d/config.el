;;; config.el -*- lexical-binding: t; -*-

;; Copyright (C) 2022-2023 Abdelhak Bougouffa

;; Personal info
(setq user-full-name "Cédric Vanconingsloo"
      user-mail-address (concat "cedric" "." "vanconingsloo" "@" "ifosup" "." "wavre" "." "be"))

;; Set the default GPG key ID, see "gpg --list-secret-keys"
;; (setq-default epa-file-encrypt-to '("XXXX"))

(setq
 ;; Set a theme for MinEmacs, supported themes include these from `doom-themes'
 ;; or built-in themes
 minemacs-theme 'doom-one) ; `doom-one' is a dark theme, `doom-one-light' is the light one

;; MinEmacs defines the variable `minemacs-fonts-plist' that is used by the
;; `+setup-fonts' function. The function checks and enables the first available
;; font from these defined in `minemacs-fonts-plist'. This variable can be
;; customized to enable some language-specific fonts.

;; You can set a list of fonts to be used, like the snippet below. The first
;; font found in the list will be used:
(plist-put minemacs-fonts-plist
           :default
           '((:family "Iosevka Fixed Curly Slab" :height 130)
             (:family "JetBrains Mono" :height 110)
             (:family "Cascadia Code" :height 130)))

;; Use "Amiri" or "KacstOne" for Arabic script (the first to be found)
;; (plist-put minemacs-fonts-plist
;;            :arabic
;;            '((:family "Amiri" :scale 0.9)
;;              (:family "KacstOne")))

;; Use "LXGW WenKai Mono" for Han (Chinese) script
;; (plist-put minemacs-fonts-plist
;;            :han
;;            '((:family "LXGW WenKai Mono" :scale 1.3)))

;; When `me-daemon' and `me-email' are enabled, MinEmacs will try to start
;; `mu4e' in background at startup. To disable this behavior, you can set
;; `+mu4e-auto-start' to nil here.
;; (setq +mu4e-auto-start nil)

(+deferred!
 ;; Auto enable Eglot in modes `+eglot-auto-enable-modes' using
 ;; `+eglot-auto-enable' (from the `me-prog' module). You can use
 ;; `+lsp-auto-enable' instead to automatically enable LSP mode in supported
 ;; modes (from the `me-lsp' module).
 (+eglot-auto-enable)

 ;; Add `ocaml-mode' to `eglot' auto-enable modes
 (add-to-list '+eglot-auto-enable-modes 'ocaml-mode)

 (with-eval-after-load 'eglot
   ;; You can use this to fill `+eglot-auto-enable-modes' with all supported
   ;; modes from `eglot-server-programs'
   (+eglot-use-on-all-supported-modes eglot-server-programs)))

;; If you installed Emacs from source, you can add the source code
;; directory to enable jumping to symbols defined in Emacs' C code.
;; (setq source-directory "~/Sources/emacs-git/")

;; I use Brave, and never use Chrome, so I replace chrome program with "brave"
(setq browse-url-chrome-program (or (executable-find "brave") (executable-find "chromium")))

;; Install some third-party packages. MinEmacs uses `use-package' and `straight'
;; for package management. It is recommended to use the same to install
;; additional packages. For example, to install `devdocs' you can use something
;; like:
(use-package devdocs
  ;; The installation recipe (from Github)
  :straight (:host github :repo "astoff/devdocs.el" :files ("*.el"))
  ;; Autoload the package when invoking these commands, note that if the
  ;; commands are already autoloaded (defined with `autoload'), this is not
  ;; needed.
  :commands devdocs-install
  ;; MinEmacs sets the `use-package-always-defer' to t, so by default, packages
  ;; are deferred to save startup time. If you want to load a package
  ;; immediately, you need to explicitly use `:demand t'.
  ;; :demand t
  ;; Set some custom variables, using the `:custom' block is recommended over
  ;; using `setq'. This will ensure calling the right setter function if it is
  ;; defined for the custom variable.
  :custom
  (devdocs-data-dir (concat minemacs-local-dir "devdocs/")))

;; Module: `me-tools' -- Package: `vterm'
;; When the libvterm present in the system is too old, you can face VTERM_COLOR
;; related compilation errors. Thil parameter tells `vterm' to download libvterm
;; for you, see the FAQ at: github.com/akermu/emacs-libvterm.
(with-eval-after-load 'vterm
  (setq vterm-module-cmake-args "-DUSE_SYSTEM_LIBVTERM=Off"))

;; Module: `me-natural-langs' -- Package: `spell-fu'
(with-eval-after-load 'spell-fu
  ;; We can use MinEmacs' helper macro `+spell-fu-register-dictionaries!'
  ;; to enable multi-language spell checking.
  (+spell-fu-register-dictionaries! "en" "fr"))

;; Module: `me-rss' -- Package: `elfeed'
(with-eval-after-load 'elfeed
  ;; Add news feeds for `elfeed'
  (setq elfeed-feeds
        '("https://itsfoss.com/feed"
          "https://github.com/abougouffa/minemacs/commits/main.atom"
          "https://linuxhandbook.com/feed"
          "https://lecrabeinfo.net/feed"
          "https://this-week-in-rust.org/rss.xml"
          "https://korben.info/feed"
          "https://python.developpez.com/index/rss"
          "https://kotlin.developpez.com/index/rss"
          "https://planet.emacslife.com/atom.xml")))

;; Module: `me-email' -- Package: `mu4e'
;; (with-eval-after-load 'mu4e
  ;; Load personal aliases, a file containing aliases, for example:
  ;; alias gmail "Firstname Lastname <some.user.name@gmail.com>"
  ;; alias work  "Firstname Lastname <some.user.name@work.com>"

  ;; (setq mail-personal-alias-file (concat minemacs-config-dir "private/mail-aliases.mailrc"))

;;  (setq +mu4e-auto-bcc-address "always.bcc@this.email") ;; Add an email address always included as BCC

  ;; Register email accounts with mu4e
  ;; Use MinEmacs' `+mu4e-register-account' helper function to register multiple accounts
;;  (+mu4e-register-account
;;   "Google mail" ;; Account name
;;   "gmail" ;; Maildir
;;   `((user-mail-address     . "account1@gmail.com")
;;     (mu4e-sent-folder      . "/gmail/Sent Mail")
;;     (mu4e-drafts-folder    . "/gmail/Drafts")
;;     (mu4e-trash-folder     . "/gmail/Trash")
     ;; These settings aren't mandatory if a `msmtp' config is used.
;;     (smtpmail-smtp-server  . "smtp.googlemail.com")
;;     (smtpmail-smtp-service . 587)
     ;; Define account aliases
;;     (+mu4e-account-aliases . ("account1-alias@somesite.org"
;;                               "account1-alias@othersite.org")
     ;; Org-msg greeting and signature
;;     (org-msg-greeting-fmt  . "Hi%s,")
     ;; Generate signature
;;     (org-msg-signature     . ,(+org-msg-make-signature
;;                                "Regards," ;; Closing phrase
;;                                "Firstname" ;; First name
;;                                "Lastname" ;; Last name
;;                                "/R&D Engineer at Some company/")
;;   'default ;; Use it as default in a multi-accounts setting
;;   'gmail)) ;; This is a Gmail account, store it and treat it accordingly (see `me-mu4e-gmail')

;; Module: `me-org' -- Package: `org'
(with-eval-after-load 'org
  ;; Set Org-mode directory
  (setq org-directory "~/Org/" ; let's put files here
        org-default-notes-file (concat org-directory "inbox.org"))
  ;; Customize Org stuff
  ;; (setq org-todo-keywords
  ;;       '((sequence "IDEA(i)" "TODO(t)" "NEXT(n)" "PROJ(p)" "STRT(s)" "WAIT(w)" "HOLD(h)" "|" "DONE(d)" "KILL(k)")
  ;;         (sequence "[ ](T)" "[-](S)" "|" "[X](D)")
  ;;         (sequence "|" "OKAY(o)" "YES(y)" "NO(n)")))

  (setq org-export-headline-levels 5)

  ;; Your Org files to include in the agenda
  (setq org-agenda-files
        (mapcar
         (lambda (f) (concat org-directory f))
         '("inbox.org"
           "agenda.org"
           "projects.org"))))

;; Module: `me-notes' -- Package: `org-roam'
;; For better integration with other packages (like `citar-org-roam'), it is
;; recommended to set the `org-roam-directory' before loading the package.
(setq org-roam-directory "~/Org/slip-box/")

(with-eval-after-load 'org-roam
  (setq org-roam-db-location (concat org-roam-directory "org-roam.db"))

  ;; Register capture template (via Org-Protocol)
  ;; Add this as bookmarklet in your browser
  ;; javascript:location.href='org-protocol://roam-ref?template=r&ref=%27+encodeURIComponent(location.href)+%27&title=%27+encodeURIComponent(document.title)+%27&body=%27+encodeURIComponent(window.getSelection())
  (setq org-roam-capture-ref-templates
        '(("r" "ref" plain "%?"
           :if-new (file+head "web/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+created: %U\n\n${body}\n")
           :unnarrowed t))))

;; Module: `me-media' -- Package: `empv'
(with-eval-after-load 'empv
  ;; Set the radio channels, you can get streams from radio-browser.info
  (setq empv-radio-channels
        '(("Europe1" . "http://ais-live.cloud-services.paris:8000/europe1.mp3"))
        ;; See: docs.invidious.io/instances/
        empv-invidious-instance "https://invidious.projectsegfau.lt/api/v1"))

;; Module: `me-ros' -- Package: `ros'
(with-eval-after-load 'ros
  (setq ros-workspaces
        (list
         (ros-dump-workspace
          :tramp-prefix "/docker:ros@ros-machine:"
          :workspace "~/ros_ws"
          :extends '("/opt/ros/noetic/"))
         (ros-dump-workspace
          :tramp-prefix "/docker:ros@ros-machine:"
          :workspace "~/ros2_ws"
          :extends '("/opt/ros/foxy/")))))

;; Module: `me-vc' -- Package: `forge'
;; (with-eval-after-load 'forge
  ;; To setup private Gitlab instance
  ;; 1. Add this to your ~/.gitconfig
  ;; [gitlab "gitlab.private.com/api/v4"]
  ;;   user = my.username
  ;; 2. Then create an access token on GitLab. I ticked api and write_repository, which seems to work fine so far. Put the token in ~/.authinfo.gpg
  ;; machine gitlab.private.com/api/v4 login my.user^forge password <token>
  ;; 3. Use this in your config:
;;  (add-to-list 'forge-alist '("gitlab.private.com" "gitlab.private.com/api/v4" "gitlab.private.com" forge-gitlab-repository)))

;; Module: `me-vc' -- Package: `jiralib2'
;; When `jiralib2' is enabled, do some extra stuff
;; (when (memq 'jiralib2 minemacs-configured-packages)
  ;; You need to set `jiralib2-url' and `jiralib2-user-login-name'
;;  (setq jiralib2-url "https://my-jira-server.tld/"
;;        jiralib2-user-login-name "my-username")

  ;; Add a hook on git-commit, so it adds the ticket number to the commit message
;;  (add-hook
;;   'git-commit-mode-hook
;;   (defun +jira-commit-auto-insert-ticket-id-h ()
;;     (when (and jiralib2-user-login-name
                ;; Do not auto insert if the commit message is not empty (ex. amend)
;;                (+first-line-empty-p)))
;;       (goto-char (point-min))
;;       (insert "\n")
;;       (goto-char (point-min))
;;       (+jira-insert-ticket-id)
;;       (insert ": ")))

(setopt calendar-week-start-day 1)
(setopt calendar-date-style 'european)
;; (setopt org-confirm-babel-evaluate nil)
(setopt plantuml-default-exec-mode 'jar)


(if (os/win)
    (+eglot-register
      '(text-mode org-mode markdown-mode rst-mode git-commit-mode)
     "ltex-ls"))

(with-eval-after-load 'ox-latex
   (setopt org-latex-packages-alist
           ' (("AUTO" "inputenc" t ("pdflatex"))
              ("" "lmodern" nil)
              ("T1" "fontenc" t ("pdflatex"))
              ("" "fontspec" t ("xelatex" "lualatex"))
              ("AUTO" "polyglossia" t ("xelatex" "lualatex"))
              ("AUTO" "babel" t ("pdflatex"))))

   ;;KOMA
 (add-to-list 'org-latex-classes
              '("koma-letter" "\\documentclass{scrletter}"
                ("\\section{%s}" . "\\section*{%s}")
                ("\\subsection{%s}" . "\\subsection*{%s}")
                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                ("\\paragraph{%s}" . "\\paragraph*{%s}")
                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

 (add-to-list 'org-latex-classes
              '("koma-article" "\\documentclass{scrartcl}"
                ("\\section{%s}" . "\\section*{%s}")
                ("\\subsection{%s}" . "\\subsection*{%s}")
                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                ("\\paragraph{%s}" . "\\paragraph*{%s}")
                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

 (add-to-list 'org-latex-classes
              '("cours" "\\documentclass{scrreprt}
\\usepackage{graphicx}
\\usepackage{array}
\\usepackage{tabularx}
\\usepackage{wrapfig}
\\usepackage[normalem]{ulem}
\\usepackage[dvipsnames,table]{xcolor}
\\usepackage{hyperref}
\\usepackage{tikz}
\\usepackage{eso-pic}
\\usepackage[framemethod=Tikz]{mdframed}
\\usepackage{csquotes}
\\usepackage{booktabs}
[NO-DEFAULT-PACKAGES]
[PACKAGES]
[EXTRA]
\\linespread{1.15}"

                ("\\chapter{%s}" . "\\chapter*{%s}")
                ("\\section{%s}" . "\\section*{%s}")
                ("\\subsection{%s}" . "\\subsection*{%s}")
                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                ("\\paragraph{%s}" . "\\paragraph*{%s}")
                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

 (add-to-list 'org-latex-classes
              '("koma-report" "\\documentclass{scrreprt}"
                ("\\part{%s}" . "\\part*{%s}")
                ("\\chapter{%s}" . "\\chapter*{%s}")
                ("\\section{%s}" . "\\section*{%s}")
                ("\\subsection{%s}" . "\\subsection*{%s}")
                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                ("\\paragraph{%s}" . "\\paragraph*{%s}")
                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

 (add-to-list 'org-latex-classes
              '("koma-book" "\\documentclass[11pt]{scrbook}"
                ("\\part{%s}" . "\\part*{%s}")
                ("\\chapter{%s}" . "\\chapter*{%s}")
                ("\\section{%s}" . "\\section*{%s}")
                ("\\subsection{%s}" . "\\subsection*{%s}")
                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

 (add-to-list 'org-latex-classes
              '("beamer" "\\documentclass[presentation]{beamer}"
                ("\\section{%s}" . "\\section*{%s}")
                ("\\subsection{%s}" . "\\subsection*{%s}"))))

(use-package powershell
  :straight (:host github :repo "jschaf/powershell.el"))
