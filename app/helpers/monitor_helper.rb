module ActsAsMonitor
  module Helper
    def monitor_tag(object)
      content_tag(:p, object.status_flag)
    end
  end
end
