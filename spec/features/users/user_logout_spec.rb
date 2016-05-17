feature 'User signs out' do
  let(:user) do
    User.create(name: 'Michael',
                email: 'michael@test.com',
                password: 'password',
                password_confirmation: 'password')
  end

  before { login email: user.email, password: user.password }

  scenario 'whilst sign in' do
    within 'form#logout' do
      click_button 'Log Out'
    end
    expect(page).to have_content 'Successfully logged out'
    expect(page).not_to have_content 'Welcome, Michael'
    expect(page).to have_selector("input[type=submit][value='Log In']")
    expect(page).not_to have_selector("input[type=submit][value='Log Out']")
  end


end
