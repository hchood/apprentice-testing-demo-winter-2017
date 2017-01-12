require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "associations" do
    it { should belong_to(:artist) }
  end

  describe "validations" do
    it { should validate_presence_of(:artist) }
    it { should validate_presence_of(:title) }
    it do
      FactoryGirl.create(:album)
      should validate_uniqueness_of(:title).scoped_to(:artist_id)
    end
  end
end
