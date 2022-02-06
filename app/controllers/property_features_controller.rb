class PropertyFeaturesController < ApplicationController
  before_action :set_property_feature, only: %i[ show destroy ]

  # GET /property_features or /property_features.json
  def index
    @property_features = PropertyFeature.all
  end

  # GET /property_features/1 or /property_features/1.json
  def show
  end

  # GET /property_features/new
  def new
    @property_feature = PropertyFeature.new
    @property_feature.property_id = params['property_id']
  end

  # GET /property_features/1/edit
  def edit
    @property_feature = PropertyFeature.find_by(property_id: params["property_id"])
  end

  # POST /property_features or /property_features.json
  def create
    @property_feature = PropertyFeature.new(property_feature_params)

    respond_to do |format|
      if @property_feature.save
        format.html { redirect_to new_address_path(property_id: @property_feature.property_id), notice: "Property feature was successfully created." }
        format.json { render :show, status: :created, location: @property_feature }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /property_features/1 or /property_features/1.json
  def update
    @property_feature = PropertyFeature.find_by(property_id: params.require(:property_feature)["property_id"])
    respond_to do |format|
      if @property_feature.update(property_feature_params)
        format.html { redirect_to edit_address_path(property_id: @property_feature.property_id), notice: "Property feature was successfully updated." }
        format.json { render :show, status: :ok, location: @property_feature }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /property_features/1 or /property_features/1.json
  def destroy
    @property_feature.destroy
    respond_to do |format|
      format.html { redirect_to property_features_url, notice: "Property feature was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_feature
      @property_feature = PropertyFeature.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_feature_params
      params.require(:property_feature).permit(:total_area, :build_area, :year_old, :rooms, :bathrooms, :social_bathrooms, :parking, :trunk, :property_id)
    end
end
