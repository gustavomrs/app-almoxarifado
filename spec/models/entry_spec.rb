require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe 'relationships' do
    it { should belong_to(:stuff) }
  end

  describe 'validations' do
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:stuff_id) }
  end

  it 'creates an entry' do
    cadeira = Stuff.create!(name: 'Cadeira')
    entry_cadeira = Entry.create!(stuff: cadeira, amount: 10)

    expect(Entry.all).to eq([entry_cadeira])
  end
end
