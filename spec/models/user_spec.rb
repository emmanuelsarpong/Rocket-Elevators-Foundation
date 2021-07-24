require 'spec_helper'
require 'rails_helper'

# tests for User model relationships

RSpec.describe User, type: :model do
  it { should have_many(:employees) }
  it { should have_many(:customers) }
end