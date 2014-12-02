class AddUseridToDailytips < ActiveRecord::Migration
  def change
    add_column :dailytips, :user_id, :integer
  end
end
