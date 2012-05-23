require 'rails/generators'
module ActsAsMonitor
    class InstallGenerator < Rails::Generators::Base
      desc "Install generator for ActsAsMonitor gem"
      source_root File.expand_path("../templates", __FILE__)
      puts("Path:#{__FILE__}")
      
      def copy_icons
        icons = ["acts_as_monitor_green.png", "acts_as_monitor_red.png", "acts_as_monitor_yellow.png"]
        icons.each do |icon| 
          destination = "public/images/" + icon
          copy_file icon, destination
          puts("  Installed:   #{destination}")
        end
      end
      
      def copy_locales
        file = "acts_as_monitor.it.yml"
        destination = "config/locales/" + file
          copy_file file, destination
          puts("  Installed:   #{destination}")
        end
      end
      
      def print_usage
        usage = <<-START
        Add acts_as_monitor to model to monitor
        Add a private metod warn_*? and error_*? to define warning and error status
        Use monitor_tag(ModelClass) to view the output
        START
      end
      
end
