require 'rails/generators'
module ActsAsMonitor
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Install generatori for ActsAsMonitor gem"
      
      def generate_install
        puts("First method")
      end
      
      def generate_test
        puts("Second method")
      end
      
    end
  end
end
