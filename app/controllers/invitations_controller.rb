class InvitationsController < ApplicationController
  before_filter :require_login, only: :new
  before_filter :admin_user, only: :index
	def new
		@invitation = Invitation.new
	end

  def index
    @invitations = Invitation.all.sort { |a, b| a.user_id <=> b.user_id }
  end

  def create
  @invitation = current_user.invitations.new(params[:invitation])

  	if @invitation.valid?
          temp_email = @invitation.email
  		if User.find_by_email(temp_email)
  	  	  flash.now.alert = "This email was already invited!"
  	  	  render "new"
  		else
          @invitation.save
          redirect_to root_url, :notice => "Invitation sent!"
          UserMailer.invitation(@invitation).deliver
      end
  	else
  	  render "new", :notice => "Somehting went wrong!"
  	end
end

  def accept_referral

      @invitation = Invitation.find_by_invite_token(params[:invite_token])
      @invitation.accepted_at = Time.zone.now
      @invitation.save!

      if cookies[:auth_token]
        cookies.delete(:auth_token)
      end
      @user = User.new
      redirect_to new_user_path(invite_token: params[:invite_token]) 
  end
end