feature 'User login' do
  let(:user) do
    User.create(name: 'Michael',
                email: 'michael@test.com',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'it logs user in' do
    login email: user.email, password: user.password
    expect(page).to have_content "Welcome, #{user.name}"
  end

  context 'logging in with incorrect credentials' do
    scenario 'incorrect email' do
      login email: 'wrong@wrong.com'
      expect(page).to have_content "Incorrect login details"
    end
    scenario 'incorrect password' do
      login password: 'wrong'
      expect(page).to have_content "Incorrect login details"
    end
  end
end
