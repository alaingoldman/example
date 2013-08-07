class UsersController < ApplicationController
  before_filter :admin_and_user, only: [:destory, :edit, :show]
  before_filter :admin_user, only: :index
  before_filter :invited_user, only: :new

  def new
  	@user = User.new
    prepare_invitation
  end

  def create
    prepare_invitation
    params[:user][:email] = @invitation.email unless @invitation.nil?
    @user = User.new(params[:user])
  	if @user.save
      unless @invitation
        UserMailer.registration_confirmation(@user).deliver
      end
      if @invitation
        @user.email_activation_token = true
        @user.save
        cookies[:auth_token] = @user.auth_token
        redirect_to root_url, :notice => "Signed up."
      else
  		redirect_to root_url, :notice => "Signed up!"
      end
  	else
      if @invitation.present?
        render "new", :notice => "will not save but invitation present"
      else
        render "new"
      end
  	end
  end 

  def accept_invitation
      @user = User.find_by_email_token(params[:email_token])
      @user.email_activation_token = true
      @user.save!

      if Time.zone.now <= @user.created_at + 1.hour
        cookies[:auth_token] = @user.auth_token
        redirect_to root_url, :notice => "Email has been activated."
      else
        redirect_to root_url, :notice => "Email has been verified."
      end
  end

  def show
    @user = User.find(params[:id]) 
    @products = @user.products
  end

  def index
    @user = User.all
  end

  def update
    @user = User.find(params[:id]) 
    # binding.pry
    @user.password_hash = nil
    if @user.update_attributes(params[:user])
      redirect_to @user, :notice => "Password has been changed!"
    else
      render "edit"
    end
  end

 def edit
 end

 # def bankacct
 # end

 # def addbankacct
 #  if (params['customer_uri'])
 #    current_user.customer_uri = (params['customer_uri'])
 #  end
 #  if current_user.save
 #    redirect_to root_url, :notice => "bank account added"
 #  else
 #    render json: {error: "Payment account could not be configured properly"}, status: 401
 #  end 
 # end

 # def bankacct
 #  customer = Balanced::Customer.find(current_user.customer_uri) if current_user.customer_uri
 #  customer.add_bank_account(params['customer_uri'])
 #  if customer.save
 #    bank_account = Balanced::BankAccount.find(params['customer_uri'])
 #    render json: bank_account
 #  else
 #    render json: {error: "Payment account could not be configured properly"}, status: 401
 #  end 
 # end


  def destroy
  @user = User.find(params[:id]) 
  if @user.present?
    @user.destroy
    redirect_to root_url
  else
    redirect_to root_url, :notice => "Could not delete"
  end
  end

  def admin_and_user
    @user = User.find(params[:id]) 
    if current_user
      if current_user == @user || current_user.admin?
      else
        redirect_to(root_url)
      end
    else
      redirect_to(root_url)
    end
  end

private 
  def prepare_invitation 
    return unless params[:invite_token].present? 
    @invitation = Invitation.find_by_invite_token(params[:invite_token]) 
    redirect_to log_in_path, notice: "Already registered" if User.where(email: @invitation.email).exists? 
  end

  def invited_user
    redirect_to root_url if params[:invite_token].nil?
  end
end