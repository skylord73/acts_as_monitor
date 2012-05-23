module ActsAsMonitor
  module Monitor
    def self.included(base) # :nodoc:
      base.send :extend, ClassMethods
    end
    
    # Class methods for the mixin
    module ClassMethods
      # defines the class method to inject monitor methods
      #
      #==Example
      # class MyModel < ActiveRecord::Base
      #   acts_as_monitor
      #   ...
      #   private
      #
      #   def warn_test?
      #     whatever you want that return true in a warning condition
      #   end
      #
      #   def error_test?
      #     whatever you want that return true in an error condition
      #   end
      def acts_as_monitor(options={})
        #~ cattr_accessor :xlsx_i18n, :xlsx_columns
        #~ self.xlsx_i18n = options.delete(:i18n) || false
        #~ self.xlsx_columns = options.delete(:columns) || self.column_names.map { |c| c = c.to_sym }
        extend ActsAsMonitor::Monitor::SingletonMethods
        include ActsAsMonitor::Monitor::InstanceMethods
      end
      
    
    end
    
    # Singleton methods for the mixin
    module SingletonMethods
    end
    
    #Instance methods for the mixin
    module InstanceMethods
      #Used to have full status description
      #
      # {:wan => [wan_name1?, ...], :error => [error_name1?...]}
      #where warn_name1? and error_name1? are private instance method defined in the monitored model
      def status
        search = /^(warn|error)_.*\?/
        out = {:warn => [], :error => []}
        methods = self.private_methods.map{|m| m.match(search) }.compact
        methods.each do |method|
          out[method[1].to_sym] << method[0].to_sym if send(method[0])
        end
        out
      end
      
      #Used to have a quick status of the model 
      #*  :red => Errors
      #*  :yellow => Warnings
      #*  :green => Nornal status
      def status_flag
        st = status
        return :red unless st[:error].blank?
        return :yellow unless st[:warn].blank?
        return :green
      end
    end
    

  end
  
end

require 'active_record'
ActiveRecord::Base.send :include, ActsAsMonitor::Monitor

