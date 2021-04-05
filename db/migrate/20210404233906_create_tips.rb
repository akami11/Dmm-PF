class CreateTips < ActiveRecord::Migration[5.2]
  def change
    create_table :tips do |t|
      t.integer :user_id
      t.text :tip_contents
      t.timestamps
    end
  end
end
