class CreateDeckCards < ActiveRecord::Migration[5.1]
  def change
    create_table :deck_cards do |t|
      t.integer :deck_id
      t.string  :card_id
      t.integer :quantity
      t.boolean :sideboard

      t.timestamps
    end
  end
end
