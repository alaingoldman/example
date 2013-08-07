class TransactionsController < ApplicationController

  def new
  	@transaction = Transaction.new
  end

  def create
  	@transaction = Transaction.new
  end

  # def new
  # 	@transaction = Transaction.new(current_user.email, 100.0, params[:transaction])
  # end
  # def create
  #   @transaction = Transaction.new(current_user.email, 100.0, params[:transaction])
  #   if @transaction.charge
  #     flash[:success] = 'Thanks for the moolah!'
  #     redirect_to root_path
  #   else
  #     flash[:error] = @transaction.errors.first
  #     render :new
  #   end
  # end

end