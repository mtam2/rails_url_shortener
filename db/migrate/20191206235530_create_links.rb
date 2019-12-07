class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.text :original_link, null: false
      t.text :uuid, null: false

      t.timestamps
    end
    add_index :links, [:original_link], unique: true
    add_index :links, [:uuid], unique: true
  end
end
