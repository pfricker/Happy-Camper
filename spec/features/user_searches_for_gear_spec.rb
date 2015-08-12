require 'rails_helper'

feature 'user searches for gear' do
  let!(:backpack) { FactoryGirl.create(:backpack) }
  let!(:tent) { FactoryGirl.create(:tent) }

  scenario 'user searches by location', js: true  do
    visit root_path
    fill_in 'location', with: '02474'
    click_button 'Find Gear'

    expect(page).to have_content(backpack.name)
  end

  scenario 'user preforms an advanced search', js: true do
    visit root_path
    choose 'search_category_Tent'
    fill_in 'location', with: '02474'
    find("#search_button").click
    fill_in 'tent[search]', with: tent.brand
    select '2', from: 'tent[capacity]'
    select 'Very Good', from: 'tent[condition]'
    click_button 'Find Gear'

    expect(page).to have_content(tent.name)
  end

end
