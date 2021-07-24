require 'spec_helper'
require 'rails_helper'

RSpec.describe LeadsController, type: :controller  do

  before(:each) do
    @lead = Lead.create!
  end

  describe "POST quotes#create" do
    it "should create a new quote" do
      lead = Lead.create!
      expect { response }.to change(Lead, :count).by(0)
    end
  end

end