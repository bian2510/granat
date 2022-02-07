class AmenitiesController < ApplicationController
  before_action :set_amenity, only: %i[ show destroy ]
  before_action :authenticate_admin!, only: %i[ edit update destroy ]

  # GET /amenities or /amenities.json
  def index
    @amenities = Amenity.all
  end

  # GET /amenities/1 or /amenities/1.json
  def show
  end

  # GET /amenities/new
  def new
    @amenity = Amenity.new
    @amenity.property_id = params['property_id']
  end

  # GET /amenities/1/edit
  def edit
    @amenity = Amenity.find_by(property_id: params["property_id"])
  end

  # POST /amenities or /amenities.json
  def create
    @amenity = Amenity.new(amenity_params)

    respond_to do |format|
      if @amenity.save
        format.html { redirect_to new_property_image_path(property_id: @amenity.property_id), notice: "Amenity was successfully created." }
        format.json { render :show, status: :created, location: @amenity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @amenity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /amenities/1 or /amenities/1.json
  def update
    @amenity = Amenity.find_by(property_id: params.require(:amenity)["property_id"])
    respond_to do |format|
      if @amenity.update(amenity_params)
        format.html { redirect_to edit_property_image_path(property_id: @amenity.property_id), notice: "Amenity was successfully updated." }
        format.json { render :show, status: :ok, location: @amenity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @amenity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /amenities/1 or /amenities/1.json
  def destroy
    @amenity.destroy
    respond_to do |format|
      format.html { redirect_to amenities_url, notice: "Amenity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_amenity
      @amenity = Amenity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def amenity_params
      params.require(:amenity).permit(:bbq, :sport_zones, :gym, :pool, :comunal_room, :property_id)
    end
end
