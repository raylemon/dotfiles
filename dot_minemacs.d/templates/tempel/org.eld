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

(cours "#+title: " p n
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
       n "#+include: \"cover.org\"" n
       )
