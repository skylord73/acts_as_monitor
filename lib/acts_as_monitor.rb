require "acts_as_monitor/version"
require "acts_as_monitor/monitor"
require File.dirname(__FILE__) + '/../app/helpers/monitor_helper'

module ActsAsMonitor
  #Include my Helper to ActionView (as they where in application_helper)
  ActionView::Base.send :include, ActsAsMonitor::Helper

end
