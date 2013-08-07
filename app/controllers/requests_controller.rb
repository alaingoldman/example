class RequestsController < ApplicationController
  before_filter :admin_user, only: :index

  def new
  	@request = Request.new
  end
  
  def index
    @requests = Request.all
  end

  def activate
    @request = Request.find(params[:request_id])
    @invitation = Invitation.new
    @invitation.email = @request.email
    @invitation.user_id = current_user.id
    @invitation.save!
    @request.activated = true
    @request.save!
    # redirect_to requests_path, :notice => "Invitation sent!"
    UserMailer.invitation(@invitation).deliver
  end

  def create
  	@request = Request.new(params[:request])
  	if @request.valid?
      if User.find_by_email(@request.email) || Invitation.find_by_email(@request.email)
      	redirect_to log_in_path, notice: "Email already in use"
      elsif @request.save
      	@request.save
        @temporary_request = @request
      	redirect_to root_url, :notice => "Request sent."
      	UserMailer.request_invitation(@temporary_request).deliver
      end
  	else
  		render "new"
  	end
  end
end