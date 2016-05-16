feature 'Create new accommodation' do
  scenario 'Saves new accommodation to database' do
    visit '/accommodations/new'
    fill_in :name, with: 'Michael\'s House'
    fill_in :desc, with: 'Cool place'
    fill_in :price, with: '50'

    expect{ click_button 'Submit' }.to change(Accommodation, :count).by 1
    expect(Accommodation.first.name).to eq 'Michael\'s House'
    expect(Accommodation.first.desc).to eq 'Cool place'
    expect(Accommodation.first.price).to eq 50.0
  end
end
