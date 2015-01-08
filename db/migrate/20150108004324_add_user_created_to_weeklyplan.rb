class AddUserCreatedToWeeklyplan < ActiveRecord::Migration
  def change
    add_column :weeklyplans, :usercreate, :integer
  end
end
