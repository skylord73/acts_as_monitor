module ActsAsMonitor
  class MonitorsController < ::ApplicationController
    
    def show
      @monitor = eval(params[:class_name]).find(params[:id]) if monitor_valid?(params)
      respond_to do |format|
        format.js do
          view = render_to_string "show"
          #render :json => {"text" => @status.status}
          render :json => {"text" => view}
        end
        format.html
      end
    end

  end    
end
