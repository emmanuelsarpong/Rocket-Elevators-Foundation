# require 'AdminLogin'

# describe Login do
#     # Test if administrator has logged in as admin
#     describe "getContent" do
#         login = Login.new
#         context 'Method output:' do
#             it 'Logs in admin as Nicolas' do
#                 email = 'nicolas.genest@codeboxx.biz'
#                 password = 'codeboxx'
#             expect(login).to be_truthy
#             end
#         end
#         context 'Method output:' do
#             it 'Checks if the login button is clicked' do
#                 click = 'login'
#             expect(login).to be_truthy
#             end
#         end
#         context 'Method output:' do
#             it 'Checks if the user can visit the Admin section of the website' do
#                 visit = '/admin'
#             expect(login).to be_truthy
#             end
#         end
#     end
# end

# if has_role?(:admin)

#     user_signed_in?

# require "ElevatorMedia"


 
# RSpec.describe ElevatorMedia::Streamer do 

#    describe ".getContent" do
#       streamer = ElevatorMedia::Streamer.new
#       context 'output type' do 
#          it 'returns an HTML' do
#             expect(streamer.getContent()).to be_kind_of String
#          end
#       end
#       context 'put a STUB on APIConnect method ' do 
#          it 'returns a predefined Hash' do
#             streamer = ElevatorMedia::Streamer.new
#             allow(streamer).to receive('APIConnect').with('Canada').and_return(
#              {"get"=>"statistics", "parameters"=>{"country"=>"Canada"}, "errors"=>[], "results"=>1, "response"=>[{"country"=>"Canada", "cases"=>{"new"=>"+1768", "active"=>24230, "critical"=>557, "recovered"=>13986, "total"=>40190}, "deaths"=>{"new"=>"+140", "total"=>1974}, "tests"=>{"total"=>612192}, "day"=>"2020-04-23", "time"=>"2020-04-23T02:45:04+00:00"}]}
#             )
#             streamer.getContent()
#             container = streamer.instance_variable_get('@canada_statistics')
#             expect(container['response'][0]['cases']['total']).to eq(40190)
#          end
#       end   
#    end

#    describe ".APIConnect" do
#       streamer = ElevatorMedia::Streamer.new
#       context 'GET request verification' do
#          it 'returns a key-value pair (JSON) structure in case of a good request APIConnect ' do
#             expect(streamer.APIConnect('Iran')).to be_a Hash
#          end
#          it 'Retuns a message in case of failure to connect or empty response'  do
#             expect(streamer.APIConnect('Nowhere')).to eq('Bad Request')
#             # expect{Streamer.APIConnect('Nowhere')}.to raise_error
#          end 
#       end
#       context 'call the .APIConnect() method using Canada as the input' do
#          it "retuns a JSON which it\'s country value is Canada" do                     
#             expect(streamer.APIConnect('Canada')['parameters']['country']).to eq("Canada")
#          end 
#       end
#    end
   
# end

# require 'AdminLogin'
# require 'rails_helper'

# RSpec.describe "User Registration", type: :system do
# #   before do
# #     driven_by(:rack_test)
# #   end

#   context "signs up a new user" do
#     it "signs a user up" do
#       visit '/users/sign_up'
#       within("#new_user") do
#         fill_in 'Email', with: 'nicolas.genest@codeboxx.biz'
#         fill_in 'Password', with: 'codeboxx'
#       end
#       click_button('Sign up') # submits the form
#       expect(page).to have_content 'You have signed up successfully'
#     end
#   end
# end