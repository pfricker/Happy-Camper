require "rails_helper"

feature 'pagination' do
  scenario 'user visits tents index' do
    FactoryGirl.create_list(:tent, 20)
    tent2 = FactoryGirl.create(:tent, name: 'Trango')
    visit tents_path

    expect(page).to_not have_content(tent2.name)
  end

end
