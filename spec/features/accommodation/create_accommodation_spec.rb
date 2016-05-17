feature 'Create new accommodation' do

  scenario 'Saves new accommodation to database' do
    fill_in_new_accom_form

    expect{ click_button 'Submit' }.to change(Accommodation, :count).by 1
    expect(Accommodation.first.name).to eq 'Michael\'s House'
    expect(Accommodation.first.desc).to eq 'Cool place'
    expect(Accommodation.first.price).to eq 50.0

    expect(current_path).to eq '/accommodations'
  end

  describe 'Mandatory fields' do
    scenario 'name is mandatory' do
      expect{ create_new_accom(name: nil) }.not_to change(Accommodation, :count)
      expect(current_path).to eq '/accommodations/new'
    end

    scenario 'price is mandatory' do
      expect{ create_new_accom(price: nil) }.not_to change(Accommodation, :count)
      expect(current_path).to eq '/accommodations/new'
    end

    scenario 'price must be a number' do
     expect{ create_new_accom(price: 'five') }.not_to change(Accommodation, :count)
     expect(current_path).to eq '/accommodations/new'
    end

    scenario 'price cannot less than 1' do
      expect{ create_new_accom(price: 0) }.not_to change(Accommodation, :count)
      expect(current_path).to eq '/accommodations/new'
    end
  end
end
