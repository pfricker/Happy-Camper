class RenameTentType < ActiveRecord::Migration
  def change
    rename_column :tents, :type, :use
  end
end
