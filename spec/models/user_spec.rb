require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:books) }
  end
  
  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it {
      should validate_length_of(:username).is_at_least(3)
    }
    it { should validate_presence_of(:password) }
    it { 
      should_not validate_length_of(:password).is_at_least(3) 
    }
  end
end
