require 'acceptance/acceptance_helper'

feature 'Add stock', %q{
  In order to be able to get quotes for new stock
  As an guest
  I want to be able to add new stock symbol
} do

  scenario 'Add new stock symbol', js: true do
    stock = create(:stock)

    visit root_path
    wait_for_ajax
    expect( find(:css, 'select#myDropdown').value ).to eq stock.id.to_s
    fill_in "name", with: "AAAA"
    click_on 'Add'
    wait_for_ajax
    expect( find(:css, 'select#myDropdown').value ).to_not eq stock.id.to_s
  end
end