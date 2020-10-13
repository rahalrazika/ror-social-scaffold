require 'rails_helper'

RSpec.describe User, type: :model do
  before { @user = FactoryBot.build(:user) }

  it 'is not valid with out any attributes' do
    expect(User.new).to_not be_valid
  end
  it 'is not valid if all attributes are nil' do
    expect(User.new(name: nil, email: nil, password: nil)).to_not be_valid
  end
  it 'is not valid if name is more than 20 characters and email and password is also entered' do
    expect(User.new(name: '123456789123456789123456789', email: 'test@test', password: '123456789')).to_not be_valid
  end
  it 'is valid if name is less than 20 characters and email and password is also entered' do
    expect(User.new(name: '1234567', email: 'test@test', password: '123456789')).to be_valid
  end

  it 'is not valid if password is less than 6 characters and name and password is also entered' do
    expect(User.new(name: '1234567', email: 'test@test', password: '1234')).to_not be_valid
  end

  it 'should have a valid factory' do
    expect(@user).to be_valid
  end

  it { should have_many(:friendships) }
  it { should have_many(:posts) }
  it { should have_many(:comments) }
  it { should have_many(:likes) }
end
