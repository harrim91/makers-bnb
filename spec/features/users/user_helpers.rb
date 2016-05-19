def sign_up(name: 'Michael',
            email: 'michael@me.com',
            password: '1234',
            password_confirmation: '1234')
  visit  '/users/new'
  within 'form#signup' do
    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign Up'
  end
end

def login(email: 'michael@test.com',
          password: 'password')
  visit '/'
  within 'form#login' do
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Log In'
  end
end
