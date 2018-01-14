class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :deck_id
      t.text    :writeup
      t.integer :result_id
      t.integer :opposing_archetype_id

      t.timestamps
    end
  end
end
