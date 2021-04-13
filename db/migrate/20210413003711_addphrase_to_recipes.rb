class AddphraseToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :phrase, :text
    add_column :recipes, :about_time, :integer, null: false, default: 0
  end
end
