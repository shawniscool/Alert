class AlertsController < ApplicationController
  before_action :all_alerts, only: [:index, :create]
  respond_to :html,:js

  def new
  	@alert = Alert.new
  	respond_to do |format|
      format.html # new.html.erb
      format.json { 
      	render 'alerts'
      }
    end
  	puts("new function for a new alert!!!")
  end

  def create
  	@alert = Alert.new(alert_params)
  	respond_to do |format|
  		if @alert.save
  			format.html { puts 'alert was successfully created.' }
        format.json { render json: @alert, status: :created, location: @alert }
      else
      	format.html { render action: "new" }
      	format.json { render json: @alert.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  	def all_alerts
  		@alerts = Alert.all
  	end

  	def alert_params
      # params.require(:alert).permit(:address,:city)
      params.require(:alert).permit(:address,:city,:state,:content)
  	end
end
