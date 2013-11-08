module ActiveLinkHelper
  def li_active_link_to(text, link, options = {})
    class_name = current_page?(link) ? 'active' : nil

    content_tag(:li, class: class_name) do
      link_to text.html_safe, link, options
    end
  end
end