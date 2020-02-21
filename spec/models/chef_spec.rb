require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end
  describe "methods" do
    xit "should return a unique array of ingredients" do
      chef = Chef.create!(name: "Tron")
      dish = chef.dishes.create!(name: "Nachos", description: "Cheesey chips of the Gods!")
      ingred1 = dish.ingredients.create!(name: "Cheese", calories: 250)
      ingred2 = dish.ingredients.create!(name: "Chips", calories: 100)
      ingred3 = dish.ingredients.create!(name: "Ground Beef", calories: 150)
      dish2 = chef.dishes.create!(name: "Tacos", description: "Cheesey chips of the Gods!")
      ingred4 = dish2.ingredients.create!(name: "Tortilla", calories: 50)
      dish2.ingredients << ingred3

      expect(chef.ingredients.length).to eq(4)
    end
  end
end
