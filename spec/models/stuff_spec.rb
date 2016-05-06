require 'rails_helper'

RSpec.describe Stuff, type: :model do
  it 'cria materiais' do
    papel = Stuff.create!(name: 'Papel')
    teclado = Stuff.create!(name: 'Teclado')

    expect(Stuff.all).to eq([papel, teclado])
  end

  it 'não remove material com entrada' do
  end

  it 'não remove material com saida' do
  end
end
