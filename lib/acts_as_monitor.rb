require "acts_as_monitor/version"
require "acts_as_monitor/monitor"
require File.dirname(__FILE__) + '/../app/helpers/monitor_helper'

module ActsAsMonitor
  class MissingMethod < StandardError
    def message
      I18n.t(:missing_method, :scope => "acts_as_monitor.errors", :default => "Add acts_as_monitor to your class")
    end
  end
  
  #Include my Helper to ActionView (as they where in application_helper)
  ActionView::Base.send :include, ActsAsMonitor::Helper

end
