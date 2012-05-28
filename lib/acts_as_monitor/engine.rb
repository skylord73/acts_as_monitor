module ActsAsMonitor
  class Engine < Rails::Engine
#    initialize "acts_as_monitor.load_app_instance_data" do |app|
#      ActsAsMonitor.setup do |config|
#        config.app_root = app.root
#      end
#    end
#    
#    initialize "acts_as_monitor.load_static_assets" do |app|
#      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
#    end
#  
    #Includes models, controllers, helpers, config/routes.rb, config/locales/*, tasks in lib/tasks/*
    engine_name :acts_as_monitor

    initializer 'acts_as_monitor.helper' do |app|
      #ActionView::Base.send :include, ActsAsMonitorHelper
      ActiveSupport.on_load(:action_controller) do
        include ActsAsMonitorHelper
      end
      ActiveSupport.on_load(:action_view) do
        include ActsAsMonitorHelper
      end
      
    end
  end
  
end
