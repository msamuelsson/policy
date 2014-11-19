class CreateFvplants < ActiveRecord::Migration
  def change
    create_table :fvplants do |t|
      t.string :gps
      t.string :address
      t.string :yearofconstruction
      t.string :fvtypology
      t.references :policy
      t.timestamps
    end
  end
end
