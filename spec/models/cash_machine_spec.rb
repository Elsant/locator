require 'rails_helper'

RSpec.describe CashMachine, type: :model do
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :latitude }
    it { should validate_presence_of :longitude }

    it { should validate_numericality_of(:latitude) }
    it { should validate_numericality_of(:longitude) }

    it { should validate_inclusion_of(:latitude).in_range(-90.0 .. 90.0) }
    it { should validate_inclusion_of(:longitude).in_range(-180.0 .. 180.0) }
  end
end
