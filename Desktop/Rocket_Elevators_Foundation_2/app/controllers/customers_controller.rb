class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy ]

  # GET /customers or /customers.json
  def index
    @customer = Customer.all
  end

  # GET /customers/1 or /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers or /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        migrate_to_dropbox
        format.html { redirect_to @customer, notice: "Customer was successfully created." }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        migrate_to_dropbox
        format.html { redirect_to @customer, notice: "Customer was successfully updated." }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customer_url, notice: "Customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def get_buildings_by_customers
    @building = Building.where("customer_id = ?", params[:customer_id])
    respond_to do |format|
      format.json { render :json => @building }
    end
  end 
 


  # def get_elevators_by_
  #   @battery = Battery.where("building_id = ?", params[:building_id])
  #   respond_to do |format|
  #     format.json { render :json => @battery }
  #   end
  # end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:CompanyName, :NameOfContact, :CompanyContactPhone, :EmailOfTheCompany, :CompanyDescription, :NameOfServiceTechAuthority, :TechAuhtorityPhone, :TechManagerServiceEmail)
    end
    # Populate dropdown menu list
    def index
    end
  
    def get_customers_by_location
      @customer = Customer.where("location_id = ?", params[:location_id])
      respond_to do |format|
        format.json { render :json => @customer }
      end
    end 
    def customer_search
      if params[:location].present? && params[:location].strip != ""
        @customer = Customer.where("location_id = ?", params[:location])
      else
        @customer = Customer.all
      end
    end
end






# # after_create :migrate_to_dropbox # call migrate_to_dropbox after creating a customer
# # after_update :migrate_to_dropbox  # call migrate_to_dropbox after updating a customer

# #########################################################
# # The funstion attachement to dropbox,
# def migrate_to_dropbox   
#     puts customer_params[:id]
#     dropbox_client = DropboxApi::Client.new(ENV["DROPBOX_TOKEN"])
#     puts dropbox_client
#     puts "**********************************"
#     puts customer_params[:EmailOfTheCompany]
#     Lead.where(email: customer_params[:EmailOfTheCompany]).each do |lead| # <----for each lead has this Email  
#       puts "lead"
#       unless lead.attachment.nil?   #<----check if the lead for attach file
#         puts "enter"
#         path = "/" + customer_params[:NameOfContact]   #<----create a variable path that has the full name of the company contact
#         begin
#           puts "create_folder"
#             dropbox_client.create_folder path

#         rescue DropboxApi::Errors::FolderConflictError => err
#           puts "The folder is not created since it already exists. just carry on with uploading the file"
#         end
#         begin
#           dropbox_client.upload(path + "/" + lead.file_name, lead.attachment)
#         rescue DropboxApi::Errors::FileConflictError => err
#           puts "File already exists in the folder.do not upload anything."
#         end
        
#         lead.attachment = nil; #<----delete  attachement to avoid duplication
#         lead.save!
#       end
#   end
# end