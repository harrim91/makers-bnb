feature 'User sign up' do
  scenario 'allows user to be registered' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Logged in as Michael")
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'cannot sign up without email address' do
    expect{ sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'email format must be correct' do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'sign up email must be unique' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end
end
