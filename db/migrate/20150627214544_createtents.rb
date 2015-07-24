class Createtents < ActiveRecord::Migration
  def change
    create_table :tents do |t|
      t.belongs_to :user, index: true
      t.string :name, null: false
      t.string :brand
      t.integer :capacity
      t.string :type
      t.string :condition

      t.timestamps null: false
    end
  end
end
