;;; config.el -*- lexical-binding: t; -*-

;; Copyright (C) 2022 Abdelhak Bougouffa

;; Personal info
(setq user-full-name "Cédric Vanconingsloo"
      user-mail-address (concat "cedric.vanconingsloo" "@" "ifosup." "wavre" "." "be"))

;; Set the default GPG key ID, see "gpg --list-secret-keys"
;; (setq-default epa-file-encrypt-to '("XXXX"))

(setq
 ;; Set a theme for MinEmacs, supported themes include these from `doom-themes'
 ;; or built-in themes
 minemacs-theme 'doom-one ; `doom-one' is a dark theme, `doom-one-light' is the light one
 ;; Set Emacs fonts, some good choices include:
 ;; - Cascadia Code
 ;; - Fira Code, FiraCode Nerd Font
 ;; - Iosevka, Iosevka Fixed Curly Slab
 ;; - IBM Plex Mono
 ;; - JetBrains Mono
 minemacs-fonts
 '(:font-family "Iosevka Fixed Curly Slab"
   :font-size 16
   :variable-pitch-font-family "IBM Plex Serif"
   :variable-pitch-font-size 16))

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
          "https://www.bonjourmadame.fr/feed/"
          "https://planet.emacslife.com/atom.xml")))

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

(with-eval-after-load 'org
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


(if os/win (setopt python-shell-interpreter "python"))
(setopt org-confirm-babel-evaluate nil)

(+eglot-register
  '(text-mode org-mode markdown-mode rst-mode git-commit-mode)
  "ltex-ls")

;; test
(with-eval-after-load 'ox
  (require 'ox-koma-letter))

(use-package powershell
  :straight (:host github :repo "jschaf/powershell.el"))
