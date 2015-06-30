class CreateSleepingbags < ActiveRecord::Migration
  def change
    create_table :sleepingbags do |t|
      t.belongs_to :user, index: true
      t.string :name, null: false
      t.string :brand
      t.integer :temp_rating
      t.string :size
      t.string :condition

      t.timestamps null: false
    end
  end
end
