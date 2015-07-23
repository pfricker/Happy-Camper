class ChangeTents < ActiveRecord::Migration
  def change
    change_column :tents, :capacity, :integer
  end
end
