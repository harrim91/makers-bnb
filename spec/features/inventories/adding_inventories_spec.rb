feature 'adding inventories' do

  let(:user) do
    User.create(name: 'Michael',
                email: 'michael@test.com',
                password: 'password',
                password_confirmation: 'password')
  end

  let(:accommodation) do
    Accommodation.create(name: 'Michael\'s House',
                         desc: 'Cool place',
                         price: 50,
                         user_id: user.id)
  end

  context 'logged in' do
    before do
      login email: user.email, password: user.password
    end

    scenario 'a range of dates can be picked' do
      visit "accommodations/#{accommodation.id}"
      fill_in :start_date, with: "10/12/2016"
      fill_in :end_date, with: "11/12/2016"
      expect{ click_button('Add Dates') }.to change(Inventory, :count).by(2)
    end
  end
end