require 'rails_helper'

RSpec.describe Stuff, type: :model do
  let!(:valid_horary) do
    now = DateTime.parse("05/05/2016 10:20:00")
    allow(DateTime).to receive(:now) { now }
  end

  describe 'relationships' do
    it { should have_many(:entries) }
    it { should have_many(:departures) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_numericality_of(:amount).is_greater_than_or_equal_to(0) }
  end

  it 'create stuffs' do
    papel = Stuff.create!(name: 'Papel')
    teclado = Stuff.create!(name: 'Teclado')
    expect(Stuff.all).to eq([papel, teclado])
  end

  it 'doesnt remove stuff with entry' do
    cadeira = Stuff.create!(name: 'Cadeira')
    entry_cadeira = Entry.create!(stuff: cadeira, amount: 10)
    expect(cadeira.destroy).to eq(false)
  end

  it 'doesnt remove stuff with entry' do
    monitor = Stuff.create!(name: 'Monitor')
    departure_monitor = Entry.create!(stuff: monitor, amount: 10)
    expect(monitor.destroy).to eq(false)
  end

  it 'creates a departure with valid horary' do
    mouse = Stuff.create!(name: 'Mouse', amount: 20)
    mouse_departure = Departure.create!(stuff: mouse, amount: 10)

    mouse.reload
    expect(mouse.can_be_removed?).to eq(false)
  end
end
