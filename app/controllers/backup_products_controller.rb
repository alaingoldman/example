class ProductsController < ApplicationController
	before_filter :require_login, only: [:create, :new]
	before_filter :admin_and_author, only: [:destory, :edit]
  before_filter :admin_user, only: :index

  def index
    @products = Product.all
  end

  def new 
  	@product = Product.new
  end

  def create
  @product = current_user.products.new(params[:product])
  # @photo = current_user.photos.new(params[:photo])
  	if @product.valid?
      @product.save!
      # @photo.product_id = @product.id
      # @photo.save!
  		# render "show", :notice => "Sale created!"
      respond_to do |format|
       format.html { redirect_to product_path(@product) }
       format.json { render json: @product }
    end
  	else
      # 4.times{ @product.photos.build }
      @product.photos.build
  		render "new", :notice => "Somehting went wrong!"
  	end
  end

  def pics
    @product = Product.find(params[:product_id])
    @photo = Photo.new
    @photo.product_id = @product.id
  end

 
  def show
    @product = Product.find(params[:id]) 
  end

  def edit
    @product = Product.find(params[:id])
    @photos_left = 4 - @product.photos.count 
    @new_photos = @photos_left.times.map{ @product.photos.build }
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      render "show", :notice => "Sale editted!"
    else
      render "edit", :notice => "Failed"
    end
  end

  def destroy
  @product = Product.find(params[:id]) 
  if @product.present?
    @product.destroy
    redirect_to products_url
  else
    redirect_to root_url, :notice => "Could not delete"
  end
  end



private

  def correct_user
    @product = current_user.products.find_by_id(params[:id])
    redirect_to root_url if @product.nil?
  end

  def admin_and_author
    @product = current_user.products.find_by_id(params[:id])
    # redirect_to root_url if @product.nil? || current_user.admin
    if !current_user.admin?
      if @product.nil?
        redirect_to root_url
      end
    end
  end



end