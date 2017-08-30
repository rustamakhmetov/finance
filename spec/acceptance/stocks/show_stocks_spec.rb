require 'acceptance/acceptance_helper'

feature 'Show stocks', %q{
  In order to be able to show quotes for selected stock
  As an guest
  I want to be able to select stock symbol
} do

  given!(:stocks) { create_list(:stock, 2) }

  scenario 'Show all stocks', js: true do
    visit root_path
    within "select#myDropdown" do
      stocks.each do |stock|
        expect(page).to have_content(stock.name)
      end
    end
  end
end