require 'rails_helper'

feature 'user searches for gear' do
  let!(:backpack) { FactoryGirl.create(:backpack) }
  let!(:tent) { FactoryGirl.create(:tent) }

  scenario 'user searches by location' do
    visit root_path
    fill_in 'location', with: '02138'
    click_button 'Search'

    expect(page).to have_content(backpack.name)
  end

  scenario 'user preforms an advanced search' do
    visit root_path
    choose 'search_category_Tent'
    fill_in 'location', with: '02138'
    find("#search_button").click
    fill_in 'tent[brand]', with: tent.brand
    select '2', from: 'tent[capacity]'
    select 'Very Good', from: 'tent[condition]'
    click_button 'Search'

    expect(page).to have_content(tent.name)
  end

end
