class PostimagesController < ApplicationController
  before_action :set_postimage, only: [:show, :edit, :update, :destroy]

  # GET /postimages
  # GET /postimages.json
  def index
    @postimages = Postimage.all
  end

  # GET /postimages/1
  # GET /postimages/1.json
  def show
  end

  # GET /postimages/new
  def new
    @postimage = Postimage.new
  end

  # GET /postimages/1/edit
  def edit
  end

  # POST /postimages
  # POST /postimages.json
  def create
    @postimage = Postimage.new(postimage_params)

    respond_to do |format|
      if @postimage.save
        format.html { redirect_to @postimage, notice: 'Postimage was successfully created.' }
        format.json { render :show, status: :created, location: @postimage }
        
      else
        format.html { render :new }
        format.json { render json: @postimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postimages/1
  # PATCH/PUT /postimages/1.json
  def update
    respond_to do |format|
      if @postimage.update(postimage_params)
        format.html { redirect_to @postimage, notice: 'Postimage was successfully updated.' }
        format.json { render :show, status: :ok, location: @postimage }
      else
        format.html { render :edit }
        format.json { render json: @postimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postimages/1
  # DELETE /postimages/1.json
  def destroy
    @postimage.destroy
    respond_to do |format|
      format.html { redirect_to postimages_url, notice: 'Postimage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postimage
      @postimage = Postimage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def postimage_params
      params.require(:postimage).permit(:name,:image, :image_cache, :remove_image)
    end
end
