class CreateBackpacks < ActiveRecord::Migration
  def change
    create_table :backpacks do |t|
      t.belongs_to :user, index: true
      t.string :name, null: false
      t.string :brand
      t.integer :capacity
      t.string :size
      t.string :condition
    end
  end
end
