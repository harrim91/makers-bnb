
feature 'User sign up' do
  scenario 'allows user to be registered' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, Noah")
  end

  scenario 'cannot sign up without email address' do
    expect{ sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario 'email format must be correct' do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  end

  scenario 'sign up email must be unique' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
  end
end
