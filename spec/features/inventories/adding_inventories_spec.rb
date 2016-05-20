feature 'adding inventories' do

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

  context 'logged in as accommodation owner' do
    before do
      login email: user.email, password: user.password
    end

    scenario 'a range of dates can be added' do
      visit "accommodations/#{accommodation.id}"
      fill_in :start_date, with: "10/12/2016"
      fill_in :end_date, with: "11/12/2016"
      expect{ click_button('Add Dates') }.to change(Inventory, :count).by(2)
      expect(page).to have_content 'Inventory sucessfully added'
    end

  end

  context 'logged in as different user' do
    before do
      login email: user2.email, password: user2.password
    end

    scenario 'no dates can be added' do
      visit "accommodations/#{accommodation.id}"
      expect(page).not_to have_css('form#new-inventories')
    end
  end

  context 'not logged in' do
    scenario 'no dates can be added' do
      visit "accommodations/#{accommodation.id}"
      expect(page).not_to have_css('form#new-inventories')
    end
  end
end
