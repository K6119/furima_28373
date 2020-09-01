class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string :name,             null: false
      t.binary :image,            null: false
      t.text :item_description,   null: false
      t.integer :item_condition_id,  null: false
      t.integer :category_id,        null: false
      t.integer :delivery_fee_id,    null: false
      t.integer :price,           null: false
      t.integer :shipping_area_id,   null: false
      t.integer :shipping_days_id,   null: false
      t.integer :user_id,         foreign_key: true
    end
  end
end
