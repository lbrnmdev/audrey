module ApplicationHelper

  def semantic_ui_class_for(flash_type)
    {
        success: "positive",
        error: "error",
        alert: "error",
        warning: "warning",
        info: "info"
    }[flash_type.to_sym] || flash_type.to_s
  end

  def semantic_ui_icon(flash_type)
    {
        success: "check circle outline icon",
        error: "warning sign icon",
        alert: "warning sign icon",
        warning: "warning circle icon",
        info: "info circle icon"
    }[flash_type.to_sym] || 'pointing up icon'
  end
end
