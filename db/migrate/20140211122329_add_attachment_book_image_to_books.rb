class AddAttachmentBookImageToBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.attachment :book_image
    end
  end

  def self.down
    drop_attached_file :books, :book_image
  end
end
