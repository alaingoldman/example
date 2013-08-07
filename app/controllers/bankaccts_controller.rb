class BankacctsController < ApplicationController

  def index 
  end

  def show
  end

  def new
  end
  
  def create
  end
  
  def addbank
      @ab = (params['customer_uri'])
      @abc = (params['id'])
      @abcd = (params['account_uri'])
      # raise "foo"
      # binding.pry
      redirect_to root_url#, :notice => "#{@id}"

  end

  def edit
  end
  
  def update
  end

end
