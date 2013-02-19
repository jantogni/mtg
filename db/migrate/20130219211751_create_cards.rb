class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.string :set_name
      t.string :set_code
      t.integer :mtg_id
      t.string :card_type
      t.string :power
      t.string :toughness
      t.string :loyalty
      t.string :manacost
      t.integer :converted_manacost
      t.string :artist
      t.text :flavor
      t.integer :number
      t.string :rarity
      t.text :ruling
      t.text :ability
      t.string :watermark

      t.timestamps
    end
  end
end
