require 'rails_helper'

RSpec.describe 'Category pages', type: :feature do
  before :all do
    @user = User.new(firstname: 'Sediq', lastname: 'badakhsh', email: 'admin@gmail.com', password: '123465')
    @group = Group.new(user: @user, name: 'Debit')
    @user.save
    @group.save
  end

  before :each do
    visit root_path
    click_link 'Log in'
    fill_in 'Email', with: 'admin@gmail.com'
    fill_in 'Password', with: '123465'
    click_button 'Log in'
  end

  after :all do
    @group.destroy
    @user.destroy
  end

  it 'Expect section Title' do
    expect(page).to have_content('CATEGORIES')
  end

  it 'Navigate to categorie\'s transaction page' do
    click_link(@group.name)
    expect(current_path).to be == user_group_entities_path(group_id: @group, user_id: @user)
    expect(page).to have_content('TRANSACTIONS')
  end

  it 'Navigate to add category page' do
    click_link('Add a new Category')
    expect(current_path).to be == new_user_group_path(user_id: @user)
  end

  it 'Add a new Category' do
    click_link('Add a new Category')
    fill_in 'Enter Category name', with: 'Movies'
    click_button('Save')
    expect(Group.last.name).to be == 'Movies'
    Group.last.destroy
  end
end