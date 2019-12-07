require 'rails_helper'

RSpec.describe Link, type: :model do
  subject { FactoryBot.build(:link) }

  describe "validations" do
    it { should validate_presence_of :original_link }
    it { should validate_presence_of :uuid }

    it { should validate_uniqueness_of :original_link }
    it { should validate_uniqueness_of :uuid }

    it "should accept valid attributes" do
      expect(subject).to be_valid
    end

    it "should not accept invalid attributes" do
      subject.original_link = "blah"
      expect(subject).to be_invalid
    end

  end

end
