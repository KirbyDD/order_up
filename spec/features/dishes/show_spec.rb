require 'rails_helper'

RSpec.describe "As a visitor to dish show page", type: :feature do
  it 'should let me see the chef and ingredients of that dish' do
    chef = Chef.create!(name: "Tron")
    dish = chef.dishes.create!(name: "Nachos", description: "Cheesey chips of the Gods!")
    ingred1 = dish.ingredients.create!(name: "Cheese", calories: 250)
    ingred2 = dish.ingredients.create!(name: "Chips", calories: 100)
    ingred3 = dish.ingredients.create!(name: "Ground Beef", calories: 150)

    visit "/dishes/#{dish.id}"

    expect(page).to have_content(chef.name)
    expect(page).to have_content(ingred1.name)
    expect(page).to have_content(ingred2.name)
    expect(page).to have_content(ingred3.name)
  end
end
