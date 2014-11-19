class CreatePolicies < ActiveRecord::Migration
  def change
    create_table :policies do |t|
      t.string :policytype
      t.references :policyholder
      t.timestamps
    end
  end
end
