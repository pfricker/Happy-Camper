class AddGenderToBackpacks < ActiveRecord::Migration
  def change
    add_column :backpacks, :gender, :string
  end
end
