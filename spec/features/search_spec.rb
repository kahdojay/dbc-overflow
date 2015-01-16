require 'rails_helper'

feature 'Search question' do
  scenario "search a keyword" do
    visit root_path
    find('#search_form').fill_in 'q', with: 'Aliquam'
    click_button 'Search'

    expect(response.body).to have_content 'Aliquam'
  end
end