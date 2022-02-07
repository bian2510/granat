class AddressesController < ApplicationController
  before_action :set_address, only: %i[ show destroy ]
  before_action :authenticate_admin!, only: %i[ edit update destroy ]
  # GET /addresses or /addresses.json
  def index
    @addresses = Address.all
  end

  # GET /addresses/1 or /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @address = Address.new
    @address.property_id = params['property_id']
  end

  # GET /addresses/1/edit
  def edit
    @address = Address.find_by(property_id: params["property_id"])
  end

  # POST /addresses or /addresses.json
  def create
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to new_amenity_path(property_id: @address.property_id), notice: "Property was successfully created." }
        format.html { redirect_to @address, notice: "Address was successfully created." }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1 or /addresses/1.json
  def update
    @property_feature = PropertyFeature.find_by(property_id: params.require(:address)["property_id"])
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to edit_amenity_path(property_id: @address.property_id), notice: "Address was successfully updated." }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1 or /addresses/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url, notice: "Address was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:address).permit(:province, :city, :municipality, :main_street, :secondary_street, :property_id)
    end
end
