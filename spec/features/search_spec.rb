require 'rails_helper'

feature 'Search question' do
  scenario "search a keyword" do
    user = create(:user)
    user.questions.create({title:'abcdefg', body: 'This is a test question'})
    visit root_path
    find('#search_form').fill_in 'q', with: 'abcdefg'
    click_button 'Search'
    expect(page.body).to have_content 'abcdefg'
    end
end