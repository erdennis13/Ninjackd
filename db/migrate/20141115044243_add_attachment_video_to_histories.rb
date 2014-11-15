class AddAttachmentVideoToHistories < ActiveRecord::Migration
  def self.up
    change_table :histories do |t|
      t.attachment :video
    end
  end

  def self.down
    remove_attachment :histories, :video
  end
end
