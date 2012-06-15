module ActsAsMonitorHelper
  def monitor_tag(object)
    raise ActsAsMonitor::MissingMethod unless object.respond_to?(:status_flag)
    status = object.status_flag
    icon = I18n.t(status, :scope => "acts_as_monitor.icons", 
                                                 :default => "acts_as_monitor_#{status.to_s}.png")
    image_tag icon, :alt => I18n.t("alt_image_#{status.to_s}", :scope => "acts_as_monitor.icons", 
                                                 :default => status.to_s.capitalize),
                    :class => "acts_as_monitor_icon_#{status.to_s}",
                    'data-class' => object.class.name, 'data-id' => object.id
  end

  def monitor_tag_js()
    path = root_path.to_s
    content_tag(:div, path, :id => 'acts_as_monitor_status_window', :style => "display: none;") +
    javascript_include_tag("acts_as_monitor_javascript.js") + 
    stylesheet_link_tag('acts_as_monitor.css')
  end

  def monitor_valid?(params)
    return false if params[:id].blank? || params[:class_name].blank?
    Rails::logger.info  eval(params[:class_name]).instance_methods.include?("status")
    return false unless eval(params[:class_name]).instance_methods.include?("status")    
    true
  end
end
