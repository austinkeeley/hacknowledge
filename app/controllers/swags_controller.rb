class SwagsController < ApplicationController
  before_action :set_swag, only: [:show, :edit, :update, :destroy]

  # GET /swags
  # GET /swags.json
  def index
    @swags = Swag.all
  end

  # GET /swags/1
  # GET /swags/1.json
  def show
  end

  # GET /swags/new
  def new
    @swag = Swag.new
  end

  # GET /swags/1/edit
  def edit
  end

  # POST /swags
  # POST /swags.json
  def create
    @swag = Swag.new(swag_params)

    respond_to do |format|
      if @swag.save
        format.html { redirect_to @swag, notice: 'Swag was successfully created.' }
        format.json { render action: 'show', status: :created, location: @swag }
      else
        format.html { render action: 'new' }
        format.json { render json: @swag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /swags/1
  # PATCH/PUT /swags/1.json
  def update
    respond_to do |format|
      if @swag.update(swag_params)
        format.html { redirect_to @swag, notice: 'Swag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @swag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swags/1
  # DELETE /swags/1.json
  def destroy
    @swag.destroy
    respond_to do |format|
      format.html { redirect_to swags_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swag
      @swag = Swag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swag_params
      params.require(:swag).permit(:name, :description)
    end
end
