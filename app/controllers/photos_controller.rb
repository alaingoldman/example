class PhotosController < ApplicationController

  def destroy
    @photo = Photo.find(params[:id]) 
    @product = Product.find(@photo.product_id)
    if @photo.present?
      @photo.destroy
      # redirect_to @product
      # ^ for some reason that works
      redirect_to (edit_product_path(:id => @product.id)), notice: "photo removed"
    else
    redirect_to root_url, :notice => "Could not delete"
    end
  end

def create
  @photo = Photo.new(params[:photo])
    respond_to do |format|
      @photo.user_id = current_user.id
      if @photo.save
        format.html {
          render :json => [@photo.to_jq_image].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: {files: [@photo.to_jq_image]}, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end
end