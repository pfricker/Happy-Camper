class AddAttachmentImageToBackpacks < ActiveRecord::Migration
  def self.up
    change_table :backpacks do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :backpacks, :image
  end
end
