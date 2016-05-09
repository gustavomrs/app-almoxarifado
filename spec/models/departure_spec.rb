require 'rails_helper'

RSpec.describe Departure, type: :model do

  let(:valid_horary) do
    now = DateTime.parse("05/05/2016 10:20:00")
    allow(DateTime).to receive(:now) { now }
  end

  let(:invalid_before_horary) do
    now = DateTime.parse("05/05/2016 08:59:00")
    allow(DateTime).to receive(:now) { now }
  end

  let(:invalid_after_horary) do
    now = DateTime.parse("05/05/2016 18:01:00")
    allow(DateTime).to receive(:now) { now }
  end

  let(:invalid_day) do
    now = DateTime.parse("08/05/2016 14:00:00")
    allow(DateTime).to receive(:now) { now }
  end

  describe 'relationships' do
    it { should belong_to(:stuff) }
  end

  describe 'validations' do
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:stuff_id) }
  end

  it 'creates a departure with valid horary' do
    valid_horary
    mouse = Stuff.create!(name: 'Mouse', amount: 20)
    mouse_departure = Departure.create!(stuff: mouse, amount: 10)

    expect(Departure.all).to eq([mouse_departure])
  end

  it 'invalid departure with amount greater than available' do
    valid_horary
    mouse = Stuff.create!(name: 'Mouse', amount: 20)
    mouse_departure = Departure.new(stuff: mouse, amount: 30)

    expect(mouse_departure).to_not be_valid
  end

  it 'invalid departure with before invalid horary' do
    invalid_before_horary
    mouse = Stuff.create!(name: 'Mouse', amount: 20)
    mouse_departure = Departure.new(stuff: mouse, amount: 10)

    expect(mouse_departure).to_not be_valid
  end

  it 'invalid departure with after invalid horary' do
    invalid_after_horary
    mouse = Stuff.create!(name: 'Mouse', amount: 20)
    mouse_departure = Departure.new(stuff: mouse, amount: 10)

    expect(mouse_departure).to_not be_valid
  end

  it 'departure with valid hour but invalid day' do
    invalid_day
    mouse = Stuff.create!(name: 'Mouse', amount: 20)
    mouse_departure = Departure.new(stuff: mouse, amount: 10)
    expect(mouse_departure).to_not be_valid
  end

end
