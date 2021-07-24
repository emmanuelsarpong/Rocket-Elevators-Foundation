require 'spec_helper'
require 'rails_helper'

# tests for Customer model relationships

RSpec.describe Customer, type: :model do
  it { should have_many(:buildings) }
  it { should belong_to(:address) }
  it { should belong_to(:user) }
end