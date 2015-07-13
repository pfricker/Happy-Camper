require 'rails_helper'

feature 'user searches for gear' do
  let!(:backpack) { FactoryGirl.create(:backpack) }
  let!(:tent) { FactoryGirl.create(:tent) }

  scenario 'user searches by model' do
    visit root_path
    fill_in 'search', with: backpack.name
    click_button 'Search'

    expect(page).to have_content(backpack.name)
  end

  scenario 'user searches by brand' do
    visit root_path
    fill_in 'search', with: backpack.brand
    click_button 'Search'

    expect(page).to have_content(backpack.name)
  end
end
