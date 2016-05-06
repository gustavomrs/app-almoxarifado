require 'rails_helper'

RSpec.describe User, type: :model do
  it 'create users' do
    david = User.create!(login: 'David', password: '159david')
    andy = User.create!(login: 'Andy', password: 'andy_ydna')

    expect(User.all).to eq([david, andy])
  end  
end