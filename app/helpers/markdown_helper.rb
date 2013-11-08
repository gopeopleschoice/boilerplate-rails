module MarkdownHelper
  def render_markdown text
    Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                            autolink: true,
                            space_after_headers: true)
    .render(text).html_safe unless text.nil?
  end
end