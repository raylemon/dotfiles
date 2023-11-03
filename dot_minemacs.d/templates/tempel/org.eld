org-mode

(note "#+attr_latex: :options [backgroundcolor=accent]" n "#+begin_note" n> p n "#+end_note")

(imgl "#+attr_latex: :float wrap :width .33\\textwidth :placement {l}{.4\\textwidth}" n "[[" p "]]")

(imgr "#+attr_latex: :float wrap :width .33\\textwidth :placement {r}{.4\\textwidth}" n "[[" p "]]")

(imgc "#+attr_latex: :width .9\\textwidth" n "[[" p "]]")

(beamer "# LTeX: language=fr"
        "#+title:" p n
        "#+author:" p n
        "#+language: fr" n
        "#+latex_compiler: lualatex" n
        "#+options: H:1 toc:nil" n
        "#+columns: %45ITEM %10BEAMER_env(Env) %10BEAMER_act(Act) %4BEAMER_col(Col) %8BEAMER_opt(Opt)" n
        "#+beamer_theme: metropolis" n
        "#+beamer_color_theme:" n
        "#+beamer_font_theme:" n
        "#+beamer_inner_theme:" n
        "#+beamer_outer_theme:" n
        "#+startup: beamer" n)

(ltex "# LTeX: language=fr")

(cours "# LTeX: language=fr" n
       "#+title: " p n
       "#+author: Cédric Vanconingsloo" n
       "#+language: fr" n
       "#+latex_class: cours" n
       "#+latex_class_options: [A4paper,11pt,titlepage,twoside]" n
       "#+latex_compiler: xelatex" n
       "#+latex_header_extra: \\usetikzlibrary{calc}" n
       "#+latex_header_extra: \\usetikzlibrary{positioning}" n
       "#+latex_header_extra: \\newmdenv[roundcorner=12pt]{note}" n
       "#+latex_header_extra: \\graphicspath{{d:/images/}}" n
       "#+latex_header_extra: \\definecolor{accent}{HTML}{" p "}" n
       "#+latex_header_extra: \\definecolor{accent1}{HTML}{" p "}" n
       "#+latex_header_extra: \\definecolor{accent2}{HTML}{" p "}" n
       "#+latex_header_extra: \\definecolor{accent3}{HTML}{" p "}" n
       "#+latex_header_extra: \\definecolor{accent4}{HTML}{" p "}" n
       "#+latex_header_extra: \\definecolor{accent5}{HTML}{" p "}" n
       "#+latex_header_extra: \\definecolor{accent6}{HTML}{" p "}" n
       "#+latex_header_extra: \\newcommand{\\minsize}{60}" n
       "#+latex_header_extra: \\newcommand{\\maxsize}{72}" n
       n "#+include: \"../cover.org\"" n
       )

(col "#+attr_latex: :options {" p "}" n
     "#+begin_multicols" n p
     "\\columnbreak" n p
     "#+end_multicols" n)

(exam "# LTeX: language=fr" n
      "#+title: " p n
      "#+author: Cédric Vanconingsloo" n
      "#+language: fr" n
      "#+options: toc:nil num:nil title:nil" n n
      "#+latex_class: koma-article" n
      "#+latex_compiler: xelatex" n
      "#+latex_header: \\usepackage[a4paper,margin=2cm,includehead,headheight=2cm]{geometry}" n
      "#+latex_header: \\usepackage{fancyhdr}" n
      "#+latex_header: \\usepackage[french]{datenumber}" n
      "#+latex_header_extra: \\pagenumbering{gobble}" n
      "#+latex_header_extra: \\setdatetoday" n
      "#+latex_header_extra: \\addtocounter{datenumber}{1}%" n
      "#+latex_header_extra: \\setdatebynumber{\\thedatenumber}" n n
      "#+begin_export latex" n
      "\\pagestyle{fancy}" n
      "\\renew_command{\\headruleskip}{80mm}" n
      "\\renew_command{\\headrulewidth}{0pt}" n n
      "\\fancyhead[L]{\\includegraphics[width=4cm]{d:/images/logo.png}}" n
      "\\fancyhead[C]{" p "\\\\" p "\\\\ AS" p "}" n
      "\\fancyhead[R]{Nom: \\rule{2cm}{.4pt} \\\\ Prénom: \\rule{2cm}{.4pt}/100 \\\\ Date: \\datedate}" n
      "#+end_export" n)

(col "#+attr_latex: :options {" p "}" n
     "#+begin_multicols" n p
     "\\columnbreak" n p
     "#+end_multicols" n)
