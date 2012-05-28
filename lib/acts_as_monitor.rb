require "active_support/dependencies"

module ActsAsMonitor
  mattr_accessor :app_root

  def self.setup
    yield self
  end

end

require "acts_as_monitor/engine"
#require "acts_as_monitor/version"
require "acts_as_monitor/monitor"
require "acts_as_monitor/exceptions"
