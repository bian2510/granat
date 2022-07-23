class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!, only: %i[ edit update destroy ]
  before_action :filter_params, only: %i[ filter ]

  # GET /properties or /properties.json
  def index
    @properties = Property.all.includes([:address, :amenity, :property_feature, :property_image]).page(params[:page])
  end

  # GET /properties/1 or /properties/1.json
  def show
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties or /properties.json
  def create
    @property = Property.new(property_params)
    @property.admin_id = current_admin.id
    respond_to do |format|
      if @property.save
        format.html { redirect_to new_property_feature_path(property_id: @property.id), notice: "Property was successfully created." }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to edit_property_feature_path(property_id: @property.id), notice: "Property was successfully updated." }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: "Property was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def filter
    @properties = Property.search_by(filter_params).page(params[:page])
    respond_to do |format|
      format.html { render :index }
      format.json { render :index, location: @properties }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:name, :description, :price, :currency, :kind, :operation, :page)
    end

    def filter_params
      params_permited = %i[
        province city municipality neighborhood from_total_area to_total_area year_old one_room
        two_rooms three_rooms four_rooms one_bathroom two_bathrooms three_bathrooms one_parking two_parking
        three_parking one_trunk two_trunk bbq sport_zones gym pool
        from_price to_price kind operation main_street page
      ]
      params.permit(params_permited).reject{|_, param| param.blank?}
    end
end
