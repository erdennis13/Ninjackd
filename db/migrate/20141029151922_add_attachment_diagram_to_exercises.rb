class AddAttachmentDiagramToExercises < ActiveRecord::Migration
  def self.up
    change_table :exercises do |t|
      t.attachment :diagram
    end
  end

  def self.down
    remove_attachment :exercises, :diagram
  end
end
