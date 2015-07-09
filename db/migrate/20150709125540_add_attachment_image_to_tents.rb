class AddAttachmentImageToTents < ActiveRecord::Migration
  def self.up
    change_table :tents do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :tents, :image
  end
end
