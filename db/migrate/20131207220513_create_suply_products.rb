class CreateSuplyProducts < ActiveRecord::Migration
  def change
    create_table :suply_products do |t|
      t.string :description
      t.integer :amount

      t.timestamps
    end
  end
end
