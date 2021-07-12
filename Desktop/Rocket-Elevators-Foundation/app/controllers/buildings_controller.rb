class BuildingsController < ApplicationController
  before_action :set_building, only: %i[ show edit update destroy ]

  def index
    @building_details = BuildingDetail.all
  end

  def load_buildingmarkers
    markerraw = []
    Building.all.each do |building1|
      address1 = Address.where(id: building1.address_id).first
      customer1 = Customer.where(id: building1.customer_id).first
      buildingdetail1 = BuildingDetail.where(InformationKey: "number of floors", building_id: building1.id).first
      addressstr = "#{address1.NumberAndStreet}"
      results = AddressGeocode.fromAddress(addressstr)

      if !results.nil? then
        clientname = customer1.CompanyName
        numoffloors = 0
        numofbatteries = 0
        numofcolumns = 0
        numofelevators = 0
        fullnameofcontact = customer1.NameOfContact
        
        if buildingdetail1.present? then
          numoffloors = buildingdetail1.Value
        end

        batteries = Battery.where(building_id: building1.id)

        batteries.each do |battery|
          numofbatteries += 1
          columns = Column.where(battery_id: battery.id)
          columns.each do |column|
            numofcolumns += 1
            elevators = Elevator.where(column_id: column.id)
            numofelevators += elevators.count
          end
        end
      
        newmarker = { 
          :coords => [results[0], results[1]],
          :numoffloors => numoffloors,
          :clientname => clientname,
          :numofbatteries => numofbatteries,
          :numofcolumns => numofcolumns,
          :numofelevators => numofelevators,
          :fullnameofcontact => fullnameofcontact
        }
        markerraw.push(newmarker)
      else
        puts "[Address invalid] #{addressstr}"
      end
    end


    markers =  Gmaps4rails.build_markers(markerraw) do |data, marker|  
      marker.lat data[:coords][0]
      marker.lng data[:coords][1]
      
      marker.infowindow render_to_string(:partial => "/building_details/info",  :locals => 
        {
          :numbersoffloors => data[:numoffloors],
          :clientname => data[:clientname],
          :numberofbatteries => data[:numofbatteries],
          :numberofcolumns => data[:numofcolumns],
          :numberofelevators => data[:numofelevators],
          :fullnameofcontact => data[:fullnameofcontact]
        }
      )  
    end 


    return markers
  end

  # GET /buildings or /buildings.json
  def index
    @buildings = Building.all
  end

  # GET /buildings/1 or /buildings/1.json
  def show
  end

  # GET /buildings/new
  def new
    @building = Building.new
  end

  # GET /buildings/1/edit
  def edit
  end

  # POST /buildings or /buildings.json
  def create
    @building = Building.new(building_params)

    respond_to do |format|
      if @building.save
        format.html { redirect_to @building, notice: "Building was successfully created." }
        format.json { render :show, status: :created, location: @building }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buildings/1 or /buildings/1.json
  def update
    respond_to do |format|
      if @building.update(building_params)
        format.html { redirect_to @building, notice: "Building was successfully updated." }
        format.json { render :show, status: :ok, location: @building }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buildings/1 or /buildings/1.json
  def destroy
    @building.destroy
    respond_to do |format|
      format.html { redirect_to buildings_url, notice: "Building was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building
      @building = Building.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def building_params
      params.require(:building).permit(:FullNameOfTheBuildingAdministrator, :EmailOfTheAdministratorOfTheBuilding, :PhoneNumberOfTheBuildingAdministrator, :FullNameOfTheTechContactForTheBuilding, :TechContactEmail, :TechContactPhone)
    end
end
