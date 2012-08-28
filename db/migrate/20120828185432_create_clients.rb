class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :dogovor
      t.integer :lic_schet
      t.integer :status
      t.text :descr

      t.timestamps
    end
  end
end
