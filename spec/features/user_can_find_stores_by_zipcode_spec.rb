require 'rails_helper'

RSpec.feature 'User can find stores by zipcode' do
  xcontext 'with a valid zipcode' do
    it 'returns the 10 nearest stores to that zipcode' do
      visit '/'

      fill_in :search, with: "80202"
      click_on 'Locate'

      expect(current_path).to eq('/search')

      within('.results-count') do
        expect(page).to have_content("16 Total Stores")
      end

      expect(page).to have_selector('.stores')

      within('.stores') do
        expect(page).to have_selector('.store', count: 10)
      end

      within first('.store') do
        expect(page).to have_selector('.long-name')
        expect(page).to have_selector('.city')
        expect(page).to have_selector('.distance')
        expect(page).to have_selector('.phone')
        expect(page).to have_selector('.store-type')
      end

    end
  end
end


# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "16 Total Stores"
# And I should see exactly 10 results
# And I should see the long name, city, distance, phone number and store type for each of the 10 results

# 