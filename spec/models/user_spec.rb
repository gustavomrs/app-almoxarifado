require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:login) }    
    it { should validate_presence_of(:password) }    
    it { should validate_uniqueness_of(:login) }    
  end

  it 'create users' do
    david = User.create!(login: 'David', password: '159david')
    andy = User.create!(login: 'Andy', password: 'andy_ydna')

    expect(User.all).to eq([david, andy])
  end  
end