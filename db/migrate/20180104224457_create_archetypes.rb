class CreateArchetypes < ActiveRecord::Migration[5.1]
  def change
    create_table :archetypes do |t|
      t.integer :format_id
      t.string :name

      t.timestamps
    end
  end
end
