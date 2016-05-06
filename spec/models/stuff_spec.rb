require 'rails_helper'

RSpec.describe Stuff, type: :model do
  describe 'relationships' do
    it { should have_many(:entries) }    
    it { should have_many(:departures) }    
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }    
    it { should validate_uniqueness_of(:name) }    
  end

  it 'create stuffs' do
    papel = Stuff.create!(name: 'Papel')
    teclado = Stuff.create!(name: 'Teclado')

    expect(Stuff.all).to eq([papel, teclado])
  end
end
