class CreateAccidents < ActiveRecord::Migration
  def change
    create_table :accidents do |t|
      t.string :name
      t.string :address
      t.string :dateofbirth
      t.string :gender
      t.references :policy
      t.timestamps
    end
  end
end
