# CURRENT FILE :: config/routes.rb
Rails.application.routes.draw do
   namespace :acts_as_monitor do
    resources :monitors, :only =>[:show]
  end
end
