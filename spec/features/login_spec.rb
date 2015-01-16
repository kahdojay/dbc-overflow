feature 'Login' do

  # TODO: BUILD OUT THIS TEST
  # scenario 'valid login sets session[:id]' do
  #   user = FactoryGirl.create(:user)
  #   visit '/login'
  #   fill_in 'user_name', with: user.name
  #   fill_in 'user_password', with: user.password
  #   click_button 'Log in'
  #   expect(page).to have_content ''
  # end

  scenario 'invalid login displays an error' do
    visit '/login'
    fill_in 'user_name', with: ''
    fill_in 'user_password', with: ''
    click_button 'Log in'
    expect(page).to have_content 'Invalid login.'
  end
end
