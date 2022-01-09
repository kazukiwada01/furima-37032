class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,        null: false
      t.integer    :ship_from_id,       null: false
      t.string     :city_name,          null: false
      t.string     :street,             null: false
      t.string     :building_name
      t.string     :phone_number,       null: false
      t.references :purchase,           null: false, foreign_key: true
    end
  end
end
