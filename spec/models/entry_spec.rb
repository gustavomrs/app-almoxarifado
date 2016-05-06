require 'rails_helper'

RSpec.describe Entry, type: :model do
  it 'cria uma entrada' do
    cadeira = Stuff.create!(name: 'Cadeira')
    entrada_cadeira = Entry.create!(stuff: cadeira, amount: 10)

    expect(Entry.all).to eq([entrada_cadeira])
  end  
end
