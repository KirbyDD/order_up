require 'rails_helper'

RSpec.describe "As a visitor to chef show page", type: :feature do
  xit 'should let me see the chef and ingredients of that dish' do
    chef = Chef.create!(name: "Tron")
    dish = chef.dishes.create!(name: "Nachos", description: "Cheesey chips of the Gods!")
    ingred1 = dish.ingredients.create!(name: "Cheese", calories: 250)
    ingred2 = dish.ingredients.create!(name: "Chips", calories: 100)
    ingred3 = dish.ingredients.create!(name: "Ground Beef", calories: 150)
    dish2 = chef.dishes.create!(name: "Tacos", description: "Cheesey chips of the Gods!")
    ingred4 = dish2.ingredients.create!(name: "Tortilla", calories: 50)
    dish2.ingredients << ingred3

    visit "/chefs/#{chef.id}"

    expect(page).to have_content(chef.name)
    expect(page).to have_link("Ingredients")
    click_on "Ingredients"
    expect(current_path).to eq("chefs/#{chef.id}/ingredients")



  end
end
