class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.integer :ingredient_id
      t.string :recipe_name
      t.string :recipe_image_id
      t.text :process
      t.timestamps
    end
  end
end
