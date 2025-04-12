require 'rouge'

# Injection pattern copied from YARD::CodeRay:
# https://github.com/sagmor/yard-coderay/blob/master/lib/yard/coderay/html_helper.rb
module ApptweakTemplateYARD::HTMLHelper

  def html_syntax_highlight_cpp(source)
    # puts "html_syntax_highlight_cpp (GEM)"
    formatter = Rouge::Formatters::HTML.new
    lexer = Rouge::Lexers::Cpp.new
    formatter.format(lexer.lex(source))
  end

end

YARD::Templates::Helpers::HtmlHelper.include(ApptweakTemplateYARD::HTMLHelper)
