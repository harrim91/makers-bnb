def fill_in_new_accom_form name: 'Michael\'s House', desc: 'Cool place', price: 50
  visit '/accommodations'
  click_button 'Post a new listing'
  fill_in :name, with: name
  fill_in :desc, with: desc
  fill_in :price, with: price
end

def create_new_accom name: 'Michael\'s House', desc: 'Cool place', price: 50
  fill_in_new_accom_form name: name, desc: desc, price: price
  click_button 'Submit'
end

def sign_up name: 'Michael', email: 'michael@me.com', password: '123'
  click_on "sign up"
  within 'form#signup' do
    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password
    click_button "Sign Up"
  end
end

def sign_up_2 name: 'Noah', email: 'noah@me.com', password: '456'
  click_on "sign up"
  within 'form#signup' do
    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password
    click_button "Sign Up"
  end
end

def request_acc
  sign_up
  create_new_accom
  click_button "Log Out"
  sign_up_2
  click_on "Michael's House"
end
