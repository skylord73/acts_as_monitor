# CURRENT FILE :: config/routes.rb
Rails.application.routes.draw do
  get "monitor" => "acts_as_monitor/monitor#index", :as => :acts_as_monitor
end
