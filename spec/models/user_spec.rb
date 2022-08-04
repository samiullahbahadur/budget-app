require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Create a valid user' do
    user = User.new(firstname: 'Sediq', lastname: 'badakhsh', email: 'sediq@gmail.com', password: '123456')

    expect(user).to be_valid
  end

  it 'Create an invalid user due to empty firstname' do
    user = User.new(firstname: '', lastname: 'badakhsh', email: 'sediq@gmail.com', password: '123456')
    expect(user).to_not be_valid
    expect(user.errors[:firstname][0]).to be == "Firstname can't be blank!"
  end
  it 'Create an invalid user due to empty lastname' do
    user = User.new(firstname: 'sediq', lastname: '', email: 'sediq@gmail.com', password: '123456')
    expect(user).to_not be_valid
    expect(user.errors[:lastname][0]).to be == "Lastname can't be blank!"
  end
end