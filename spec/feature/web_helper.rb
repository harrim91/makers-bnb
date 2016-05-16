def sign_up
  visit   '/users/new'
  fill_in :name, with: 'Noah'
  fill_in :email, with: 'toplad@mate.com'
  fill_in :password, with: '1234'
  fill_in :password_confirmation, with: '1234'
  click_button 'Sign Up'
end
