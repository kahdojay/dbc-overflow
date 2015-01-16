feature 'Login' do
  scenario 'invalid login displays an error' do
    visit '/login'
    fill_in 'user_name', with: ''
    fill_in 'user_password', with: ''
    click_button 'Log in'
    expect(page).to have_content 'Invalid login.'
  end
end
