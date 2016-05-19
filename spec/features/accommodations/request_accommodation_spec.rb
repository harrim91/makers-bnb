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
      fill_in 'check_in', with: '02/05/2016'
      fill_in 'check_out', with: '04/05/2016'
      click_button "Request Booking"

      expect(page.status_code).to eq(200)
      expect(current_path).to eq "/"

      expect(page).to have_content "You have requested Michael's House"
      expect(page).to have_content "May 02, 2016 to May 04, 2016"
    end
  end
end
