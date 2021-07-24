require 'spec_helper'
require 'rails_helper'

RSpec.describe ElevatorsController, type: :controller  do

  before(:each) do
    @elevator = Elevator.create!
  end

  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

end