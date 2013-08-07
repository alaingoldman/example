class ProductsController < ApplicationController
	before_filter :require_login, only: [:create, :new]
	before_filter :admin_and_author, only: [:destory, :edit]
  before_filter :admin_user, only: :index

  def index
    @products = Product.all
  end

  def new 
    delete_extra_images
  	@product = Product.new
    @photo = Photo.new
  end

  def create
    if check_for_images == []
      redirect_to products_new_path, :notice => "Add an image then press start before submit"
    else 
      @product = current_user.products.create(params[:product])
      if @product.save
        add_images_to_product
        render "show", notice: "Product created!"
      else
        @photo = Photo.new
        render action: "new"
      end
    end
  end

  def pics
    
  end
 
  def show
    @product = Product.find(params[:id])
  end

  def edit
    delete_extra_images
    @product = Product.find(params[:id])
    @photo = Photo.new
  end

  def update
    @product = Product.find(params[:id])
    add_images_to_product
    @total_images = Photo.where(:product_id => @product.id)
    if @total_images == []
      redirect_to edit_product_path, :notice => "You have to add an image to this product"
    else
      if @product.update_attributes(params[:product])
        render "show", :notice => "Sale editted!"
      else
        @photo = Photo.new
        render "edit", :notice => "Failed"
      end
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

  def delete_extra_images
    Photo.where(:product_id => nil, :user_id => current_user).delete_all
    #deletes all photos that are not associated with a product yet
  end

  def add_images_to_product
    Photo.where(:product_id => nil, :user_id => current_user).update_all(:product_id => @product.id)
    #finds ALL photos updated by current user and connect them to the product
  end

  def check_for_images
    @check_for_image = Photo.where(:product_id => nil, :user_id => current_user)
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