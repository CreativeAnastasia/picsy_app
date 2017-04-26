class UploadsController < ApplicationController

  def index
    @uploads = current_user.uploads
  end

  def all
    if !params.has_key?(:cat) || params[:cat] == 'all'
      @uploads = Upload.all
    else
      @uploads = Upload.includes(:categories).where(categories: {id: params[:cat]})
    end
    @categories = Category.all
  end

  def show
    @upload = Upload.find(params[:id])
  end

  def new
    @upload = Upload.new
    @categories = Category.all
  end

  def create
    @upload = Upload.create(upload_params)
    @upload.user = current_user
    if @upload.save
      redirect_to upload_path(@upload)
    else
      render :new
    end
  end

  def edit
    @upload = Upload.find(params[:id])
    @categories = Category.all
  end

  def update
    @upload = Upload.find(params[:id])
      if @upload.update(upload_params)
        redirect_to @upload, notice: 'Picture was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @upload = Upload.find(params[:id])
      if @upload.destroy
        flash[:notice] = "Successfully deleted photo!"
        redirect_to uploads_path
      else
        flash[:alert] = "Error deleting photo!"
      end
  end

private
  def upload_params
    params.require(:upload).permit(:description, :image, category_ids:[])
  end
end


