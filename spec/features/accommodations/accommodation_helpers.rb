def fill_in_new_accom_form name: 'Michael\'s House', desc: 'Cool place', price: 50
  visit '/accommodations'
  click_button 'Post a new listing'
  fill_in :name, with: name
  fill_in :desc, with: desc
  fill_in :price, with: price
end

def create_new_accom name: 'Michael\'s House', desc: 'Cool place', price: 50
  fill_in_new_accom_form name: name, desc: desc, price: price
  fill_in :startdate, with: "02/03/2016"
  fill_in :enddate, with: "03/03/2016"
  click_button 'Create Accommodation'
end

# Time.new.strftime("%e/%m/%Y")
# Time.new.+(86400).strftime("%e/%m/%Y")
