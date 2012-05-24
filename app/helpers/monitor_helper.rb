module ActsAsMonitor
  module Helper
    def monitor_tag(object)
      raise ActsAsMonitor::MissingMethod unless object.respond_to?(:status_flag)
      icon = I18n.t(object.status_flag, :scope => "acts_as_monitor.icons", 
                                                   :default => "acts_as_monitor_#{object.status_flag.to_s}.png")
      image_tag icon, :alt => I18n.t(:alt_image, :scope => "acts_as_monitor.icons", 
                                                   :default => "Click to view details")
    end
  end
end
