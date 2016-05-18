feature "Request accommodation" do
  context 'When logged in' do

    let(:user) do
      User.create(name: 'Michael',
                  email: 'michael@test.com',
                  password: 'password',
                  password_confirmation: 'password')
    end

    before { login email: user.email, password: user.password }

    scenario "can request accommodation" do
      request_acc
      fill_in 'check_in', with: '05/02/2016'
      fill_in 'check_out', with: '05/04/2016'
      click_button "Request Booking"

      expect(page.status_code).to eq(200)
      expect(current_path).to eq "/accommodations"

      expect(page).to have_content "You have requested Michael's House"
    end
  end
end
