class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  # def handle_unverified_request
  #   sign_out
  #   super
  # end

  def is_active?(link_path)
    binding.pry
    if current_page?(link_path)
    "active"
    else
    ""
    end
  end


private
  def current_user
  	@current_user ||= User.find_by_auth_token(cookies[:auth_token]) 
  end

  def require_login
    if current_user == nil
      redirect_to root_url
    end
  end

  def admin_user
    if current_user == nil 
      redirect_to(root_path)
    elsif !current_user.admin?
      redirect_to(root_path)
    end
  end


end