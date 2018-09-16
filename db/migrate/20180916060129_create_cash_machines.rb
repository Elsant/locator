class CreateCashMachines < ActiveRecord::Migration[5.2]
  def change
    create_table :cash_machines do |t|
      t.string :name
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6

      t.timestamps
    end
    add_index :cash_machines, :latitude
    add_index :cash_machines, :longitude
  end
end