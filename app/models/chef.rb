class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes


  def ingredients
    search = dishes.joins(:dish_ingredients).select(dish_ingredient[:ingredient_id])
    Ingredient.find(search)
  end
end
