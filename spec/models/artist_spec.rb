require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe "associations" do
    # ...
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it do
      FactoryGirl.create(:artist)
      should validate_uniqueness_of(:name)
    end
  end

  # also test class methods, and then instance methods
end
