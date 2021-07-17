require 'net/http'
require 'uri'

class Lead < ApplicationRecord
	has_one_attached :file

	before_create :send_zendesk
	before_create :migrate_to_dropbox # call migrate_to_dropbox after creating a customer
	#after_update :migrate_to_dropbox  # call migrate_to_dropbox after updating a customer
	
	def send_zendesk
		if !($zenclient && ENV["ZENDESK_URL"] && ENV["ZENDESK_TOKEN"] && ENV["ZENDESK_OAUTH_TOKEN"] && ENV["ZENDESK_EMAIL"] && ENV["ZENDESK_PASSWORD"]) || $rocketseeding then
			
			return
		end

		subject = "#{self.FullName} from #{self.CompanyName}"
		comment = "The contact #{self.FullName} from company #{self.CompanyName} can be reached at email  #{self.Email} and at phone number #{self.Phone}. #{self.Departement} has a project named #{self.ProjectName} which would require contribution from Rocket Elevators.\n#{self.ProjectDescription}"
		ticket = ZendeskAPI::Ticket.create($zenclient, :subject => subject, :comment => { :value => comment }, :priority => "normal", :type => "question" ) # :email_ccs => [{ :user_email => :Email, :action => "put"}],
		
		if !self.file.nil? && self.file.attached? then
			uri = URI.parse(ENV["ZENDESK_URL"]+"/uploads.json?filename=#{SecureRandom.hex}.png")
			request = Net::HTTP::Post.new(uri)
			request.basic_auth(ENV["ZENDESK_EMAIL"], ENV["ZENDESK_PASSWORD"])
			request.content_type = "application/binary"
			request.body = ""
			request.body << self.file.download
			req_options = {
			  use_ssl: uri.scheme == "https",
			}
			# 
			response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
			  http.request(request)
			end
			jsonresponse = JSON.parse(response.body)

			token = jsonresponse["upload"]["token"]
		
			uriupload = URI.parse(ENV["ZENDESK_URL"]+"/tickets/"+ticket.id.to_s)
			requestupload = Net::HTTP::Put.new(uriupload)
			requestupload.basic_auth(ENV["ZENDESK_EMAIL"], ENV["ZENDESK_PASSWORD"])
			requestupload.content_type = "application/json"
			requestupload.body = JSON.dump({
			  "ticket" => {
				"comment" => {
				  "body" => "Attachment:",
				  "uploads" => [
					token
				  ]
				}
			  }
			})
		  
			req_options = {
			  use_ssl: uriupload.scheme == "https",
			}

			responseupload = Net::HTTP.start(uriupload.hostname, uriupload.port, req_options) do |http|
			  http.request(requestupload)
			end

		end
	end

	#########################################################
	# The funstion attachement to dropbox,
	def migrate_to_dropbox   
		if $rocketseeding then
			return
		end
		puts self.id
		dropbox_client = DropboxApi::Client.new(ENV["DROPBOX_TOKEN"])
		puts dropbox_client
		puts self.Email						  #delete later
		# lead = Lead.find_by(email: self.Email)
		# puts "lead"
		if self.file.attached?
			puts "*********************"  
			puts self.AttachedFile
			puts "*********************"
			puts self.file.attached?
			puts "*********************"
			puts self.file
			puts "*********************"
			if self.file.attached? #<----check if the lead for attach file
				puts "enter"
				path = "/" + self.FullName #<----create a variable path that has the full name of the company contact
				
				begin
					puts "create_folder"
					dropbox_client.create_folder path
				rescue DropboxApi::Errors::FolderConflictError => err
					puts "The folder is not created since it already exists. just carry on with uploading the file"
				end

				begin
					dropbox_client.upload(path + "/" + self.file.filename.base + self.file.filename.extension_with_delimiter, self.file.download)
				rescue DropboxApi::Errors::FileConflictError => err
					puts "File already exists in the folder.do not upload anything."
					while true
						dupecounter = 1
						begin
							dropbox_client.upload(path + "/" + self.file.filename.base + dupecounter.to_s + self.file.filename.extension_with_delimiter, self.file.download)
							break
						rescue DropboxApi::Errors::FileConflictError => err
							dupecounter += 1
						end
					end
				end
			end
			self.AttachedFile = nil; #<----delete  attachement to avoid duplication
			self.file.purge
		end
	end
end