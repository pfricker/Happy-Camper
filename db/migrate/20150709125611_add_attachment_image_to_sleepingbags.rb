class AddAttachmentImageToSleepingbags < ActiveRecord::Migration
  def self.up
    change_table :sleepingbags do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :sleepingbags, :image
  end
end
