class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :ingredient_name
      t.string :quantity
      t.timestamps
    end
  end
end
