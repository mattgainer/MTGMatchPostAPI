class CreateMatchCards < ActiveRecord::Migration[5.1]
  def change
    create_table :match_cards do |t|
      t.boolean :in
      t.integer :quantity
      t.integer :deck_card_id
      t.integer :match_id

      t.timestamps
    end
  end
end
