
feature 'User sign up' do
  scenario 'allows user to be registered' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, Noah")
  end

end
