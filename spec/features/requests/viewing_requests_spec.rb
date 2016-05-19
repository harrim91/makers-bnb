feature 'Viewing Requests' do

  let(:user) do
    User.create(name: 'Michael',
                email: 'michael@test.com',
                password: 'password',
                password_confirmation: 'password')
  end

  let(:user2) do
    User.create(name: 'Dan',
                email: 'dan@test.com',
                password: 'password',
                password_confirmation: 'password')
  end

  let(:accommodation) do
    Accommodation.create(name: 'Michael\'s House',
                         desc: 'Cool place',
                         price: 50,
                         user_id: user.id)
  end

  let(:start_date) do
    (Time.new()+(86360 * 7)).strftime("%d/%m/%Y")
  end

  let(:end_date) do
    (Time.new()+(86360 * 14)).strftime("%d/%m/%Y")
  end

  context 'logged in as guest' do
    before do
      login email: user2.email, password: user2.password
    end

    scenario 'can view the requests I have made' do
      visit "/accommodations/#{accommodation.id}"
      within 'form#new-request' do
        fill_in 'check_in', with: start_date
        fill_in 'check_out', with: end_date
        click_button "Request Booking"
      end

      within 'header' do
        click_on "Requests"
      end

      expect(page.status_code).to eq 200
      expect(current_path).to eq '/requests'

      within 'table#sent-requests' do
        expect(page).to have_content "Michael's House"
        expect(page).to have_content "#{start_date}"
        expect(page).to have_content "#{end_date}"
      end
    end
  end

  context 'logged in as a host' do
    before do
      login email: user2.email, password: user2.password
      visit "/accommodations/#{accommodation.id}"
      within 'form#new-request' do
        fill_in 'check_in', with: start_date
        fill_in 'check_out', with: end_date
        click_button 'Request Booking'
      end
      within 'header' do
        click_button 'Log Out'
      end
      login email: user.email, password: user.password
    end

    scenario 'can view requests I have received' do
      within 'header' do
        click_on "Requests"
      end

      expect(page.status_code).to eq 200
      expect(current_path).to eq '/requests'

      within 'table#received-requests' do
        expect(page).to have_content "Michael's House"
        expect(page).to have_content "#{start_date}"
        expect(page).to have_content "#{end_date}"
        expect(page).to have_content "Dan"
      end
    end
  end

  context 'not logged in' do

  end
end
