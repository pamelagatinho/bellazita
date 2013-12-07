class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :code
      t.string :description
      t.decimal :price, :precision => 10, :scale => 2

      t.timestamps
    end
  end
end
