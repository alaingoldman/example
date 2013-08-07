class EmailActivationsController < ApplicationController

	def edit
  		@user = User.find_by_email_activation_token!(params[:email_token])
  		@user.email_activation_token = true
  		@user.save!
  		if Time.zone.now <= @user.created_at + 1.hour
  		    cookies[:auth_token] = @user.auth_token
  			redirect_to root_url, :notice => "Email has been activated."
  		else
  		    redirect_to root_url, :notice => "Email has been verified."
  	    end
	end

	def new
		@user = User.find_by_email_activation_token!(params[:email_token])
	end

	def edit
	end
end