module ApplicationHelper
  FLASH_TYPES = [:error, :warning, :success, :message, :notice]
  def display_flash(type = nil)
    html = ""
    if type.nil?
      FLASH_TYPES.each { |name| html << display_flash(name) }
    else
      case type
      when :error
        return flash[type].blank? ? "".html_safe : "<div id='flash_container' class=\"alert alert-error\"><a class=\"close\" data-dismiss=\"alert\" href=\"#\">&times;</a>#{flash[type]}</div>".html_safe
      when :warning
        return flash[type].blank? ? "".html_safe : "<div id='flash_container' class=\"alert\"><a class=\"close\" data-dismiss=\"alert\" href=\"#\">&times;</a>#{flash[type]}</div>".html_safe
      when :notice
        return flash[type].blank? ? "".html_safe : "<div id='flash_container' class=\"alert alert-info\"><a class=\"close\" data-dismiss=\"alert\" href=\"#\">&times;</a>#{flash[type]}</div>".html_safe
      when :success
        return flash[type].blank? ? "".html_safe : "<div id='flash_container' class=\"alert alert-success\"><a class=\"close\" data-dismiss=\"alert\" href=\"#\">&times;</a>#{flash[type]}</div>".html_safe
      end
    end
    html.html_safe
  end
end
