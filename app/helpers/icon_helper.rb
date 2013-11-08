module IconHelper
  def icon_tag name
    content_tag :i, "", class: "icon-#{name}"
  end
end