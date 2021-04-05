class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.integer :category_id
      t.integer :user_id
      t.string :food_name
      t.string :food_image_id
      t.float :calorie
      t.float :protein
      t.float :fat
      t.float :carbohydrate
      t.float :salt_equivalent
      t.text :other_nutrition
      
      t.timestamps
    end
  end
end
