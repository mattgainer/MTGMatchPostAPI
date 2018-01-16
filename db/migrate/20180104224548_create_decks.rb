cclass CreateDecks < ActiveRecord::Migration[5.1]
  def change
    create_table :decks do |t|
      t.string :name
      t.integer :user_id
      t.integer :archetype_id

      t.timestamps
    end
  end
end
