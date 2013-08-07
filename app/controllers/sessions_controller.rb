class SessionsController < ApplicationController
  def new
  end
 
  def create
  	user = User.authenticate(params[:email].downcase, params[:password])
      if user
        if user.email_activation_token == true
          if params[:remember_me]
            cookies.permanent[:auth_token] = user.auth_token
          else
  	  	    cookies[:auth_token] = user.auth_token
          end
  	  	  redirect_to root_url, :notice => "Logged in!"
        else
          flash.now.alert = "You email has not yet been verified. Please click the link in your email." 
          render "new"
        end
  	  else
  	  	flash.now.alert = "Invalid email or password"
  	  	render "new"
  	  end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Logged out!"
  end


end
