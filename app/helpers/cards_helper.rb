# encoding: utf-8
module CardsHelper
  def parse_gatherer_tokens(text)
    tokens = {
      '#_' => '<b>', '_#' => '</b>',
      '£' => '<br />',
      '{X}' => image_tag("mtg_icons/x.gif", :alt => "{X}"),
      '{0}' => image_tag("mtg_icons/0.gif", :alt => "{0}"),
      '{1}' => image_tag("mtg_icons/1.gif", :alt => "{1}"),
      '{2}' => image_tag("mtg_icons/2.gif", :alt => "{2}"),
      '{3}' => image_tag("mtg_icons/3.gif", :alt => "{3}"),
      '{4}' => image_tag("mtg_icons/4.gif", :alt => "{4}"),
      '{5}' => image_tag("mtg_icons/5.gif", :alt => "{5}"),
      '{6}' => image_tag("mtg_icons/6.gif", :alt => "{6}"),
      '{7}' => image_tag("mtg_icons/7.gif", :alt => "{7}"),
      '{8}' => image_tag("mtg_icons/8.gif", :alt => "{8}"),
      '{9}' => image_tag("mtg_icons/9.gif", :alt => "{9}"),
      '{10}' => image_tag("mtg_icons/10.gif", :alt => "{10}"),
      '{R}' => image_tag("mtg_icons/r.gif", :alt => "{R}"),
      '{U}' => image_tag("mtg_icons/u.gif", :alt => "{U}"),
      '{B}' => image_tag("mtg_icons/b.gif", :alt => "{B}"),
      '{W}' => image_tag("mtg_icons/w.gif", :alt => "{W}"),
      '{G}' => image_tag("mtg_icons/g.gif", :alt => "{G}"),
      '{GB}' => image_tag("mtg_icons/gb.gif", :alt => "{GB}"),
      '{GU}' => image_tag("mtg_icons/gu.gif", :alt => "{GU}"),
      '{GR}' => image_tag("mtg_icons/gr.gif", :alt => "{GR}"),
      '{RB}' => image_tag("mtg_icons/rb.gif", :alt => "{RB}"),
      '{RW}' => image_tag("mtg_icons/rw.gif", :alt => "{RW}"),
      '{RG}' => image_tag("mtg_icons/rg.gif", :alt => "{RG}"),
      '{UB}' => image_tag("mtg_icons/ub.gif", :alt => "{UB}"),
      '{UG}' => image_tag("mtg_icons/ug.gif", :alt => "{UG}"),
      '{UW}' => image_tag("mtg_icons/uw.gif", :alt => "{UW}"),
      '{UR}' => image_tag("mtg_icons/ur.gif", :alt => "{UR}"),
      '{WB}' => image_tag("mtg_icons/ub.gif", :alt => "{WB}"),
      '{WG}' => image_tag("mtg_icons/ug.gif", :alt => "{WG}"),
      '{T}' => image_tag("mtg_icons/tap.gif", :alt => "{T}"),
    }
    text = text.gsub(/(#_|_#|£)/){ tokens[$1] }
    text = text.gsub(/(\{X\}|\{0\}|\{1\}|\{2\}|\{3\}|\{4\})/){ tokens[$1] }
    text = text.gsub(/(\{5\}|\{6\}|\{7\}|\{8\}|\{9\}|\{10\})/){ tokens[$1] }
    text = text.gsub(/(\{GU\}|\{GB\}|\{GR\}|\{RB\}|\{RW\}|\{UB\})/){ tokens[$1] }
    text = text.gsub(/(\{UW\}|\{UG\}|\{UR\}|\{WB\}|\{WG\}|\{RG\})/){ tokens[$1] }
    text = text.gsub(/(\{T\})/){ tokens[$1] }
    text.gsub(/(\{R\}|\{U\}|\{B\}|\{W\}|\{G\})/){ tokens[$1] }.html_safe
  end
  
end
