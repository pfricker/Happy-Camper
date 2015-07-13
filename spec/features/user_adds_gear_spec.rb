require 'rails_helper'

feature 'User adds a new item of gear' do
  let(:user) { FactoryGirl.create(:user)}

  before do
    visit root_path
    sign_in_as(user)
    click_link 'My Account'
  end

  scenario 'user adds new tent' do
    click_link 'Add New Tent'
    fill_in 'Name', with: 'Trango 2'
    fill_in 'Brand', with: 'Mountain Hardwear'
    click_button 'Add'

    expect(page).to have_content('Trango 2')
  end

  scenario 'user adds new tent' do
    click_link 'Add New Tent'
    click_button 'Add'

    expect(page).to have_content("Name can't be blank")
  end

end
