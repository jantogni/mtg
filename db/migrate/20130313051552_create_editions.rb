class CreateEditions < ActiveRecord::Migration
  def change
    create_table :editions do |t|
      t.string :name
      t.string :code
      t.date :date
      t.boolean :is_promo

      t.timestamps
    end
  end
end
