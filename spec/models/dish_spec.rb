require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end
  describe 'methods' do
    it 'can calculate total_calories' do
      chef = Chef.create!(name: "Tron")
      dish = chef.dishes.create!(name: "Nachos", description: "Cheesey chips of the Gods!")
      ingred1 = dish.ingredients.create!(name: "Cheese", calories: 250)
      ingred2 = dish.ingredients.create!(name: "Chips", calories: 100)
      ingred3 = dish.ingredients.create!(name: "Ground Beef", calories: 150)

      expect(dish.total_calories).to eq(500)
    end
  end
end
