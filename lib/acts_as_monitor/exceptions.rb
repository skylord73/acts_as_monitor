#Defines Custom Exceptions
module ActsAsMonitor
  
  class MissingMethod < StandardError
    def message
      I18n.t(:missing_method, :scope => "acts_as_monitor.errors", :default => "Add acts_as_monitor to your class")
    end
  end
end
