class AddressGeocodesController < ApplicationController
  before_action :set_address_geocode, only: %i[ show edit update destroy ]

  # GET /address_geocodes or /address_geocodes.json
  def index
    @address_geocodes = AddressGeocode.all
  end

  # GET /address_geocodes/1 or /address_geocodes/1.json
  def show
  end

  # GET /address_geocodes/new
  def new
    @address_geocode = AddressGeocode.new
  end

  # GET /address_geocodes/1/edit
  def edit
  end

  # POST /address_geocodes or /address_geocodes.json
  def create
    @address_geocode = AddressGeocode.new(address_geocode_params)

    respond_to do |format|
      if @address_geocode.save
        format.html { redirect_to @address_geocode, notice: "Address geocode was successfully created." }
        format.json { render :show, status: :created, location: @address_geocode }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @address_geocode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /address_geocodes/1 or /address_geocodes/1.json
  def update
    respond_to do |format|
      if @address_geocode.update(address_geocode_params)
        format.html { redirect_to @address_geocode, notice: "Address geocode was successfully updated." }
        format.json { render :show, status: :ok, location: @address_geocode }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @address_geocode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /address_geocodes/1 or /address_geocodes/1.json
  def destroy
    @address_geocode.destroy
    respond_to do |format|
      format.html { redirect_to address_geocodes_url, notice: "Address geocode was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address_geocode
      @address_geocode = AddressGeocode.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def address_geocode_params
      params.require(:address_geocode).permit(:address, :latitude, :longtitude)
    end
end
