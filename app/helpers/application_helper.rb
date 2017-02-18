module ApplicationHelper
  def markdownify(content)
    pipeline = HTML::Pipeline.new [
      HTML::Pipeline::MarkdownFilter,
      HTML::Pipeline::SanitizationFilter
    ], { gfm: true }

    # Make all links to open in new tab
    result = pipeline.call(content)[:output]
    result.xpath('.//a').each do |link|
      link[:target] = 'blank'
    end

    result.to_s.html_safe
  end
end
