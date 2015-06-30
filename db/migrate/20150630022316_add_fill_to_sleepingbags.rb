class AddFillToSleepingbags < ActiveRecord::Migration
  def change
    add_column :sleepingbags, :fill, :string
  end
end
