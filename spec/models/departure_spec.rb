require 'rails_helper'

RSpec.describe Departure, type: :model do

  describe 'relationships' do
    it { should belong_to(:stuff) }    
  end

  describe 'validations' do
    it { should validate_presence_of(:amount) }    
    it { should validate_presence_of(:stuff_id) }    
  end

  it 'creates a departure' do
    mouse = Stuff.create!(name: 'Mouse')
    mouse_departure = Departure.create!(stuff: mouse, amount: 10)

    expect(Departure.all).to eq([mouse_departure])
  end  
end
