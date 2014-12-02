class AddShowdateToDailytips < ActiveRecord::Migration
  def change
    add_column :dailytips, :show_date, :date
  end
end
