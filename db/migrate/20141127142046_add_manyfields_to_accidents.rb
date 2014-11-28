class AddManyfieldsToAccidents < ActiveRecord::Migration
  def change
    add_column :accidents, :taxcode, :string
    add_column :accidents, :weight,  :string
    add_column :accidents, :height, :string 
    add_column :accidents, :occupation, :string
    add_column :accidents, :smoker, :string
    add_column :accidents, :typeofsmoke, :string
    add_column :accidents, :smokequantity, :string
    add_column :accidents, :stopdate, :date
    add_column :accidents, :alcohol, :string
    add_column :accidents, :typeofalcohol, :string
    add_column :accidents, :alcoholquantity, :string
    add_column :accidents, :nrflights, :string
    add_column :accidents, :motorkm, :string
  end
end
