require 'acceptance/acceptance_helper'

feature 'Delete stock', %q{
  In order to be able to delete stock
  As an guest
  I want to be able to delete stock symbol
} do

  scenario 'Delete stock symbol', js: true do
    stock = create(:stock)

    visit root_path
    wait_for_ajax
    expect( find(:css, 'select#myDropdown').value ).to eq stock.id.to_s
    click_on 'Del'
    wait_for_ajax
    expect( find(:css, 'select#myDropdown').text ).to eq ""
  end
end