module MarkdownHelper
  def markdown_to_html(source)
    Kramdown::Document.new(source, input: 'GFM').to_html
  end
end
