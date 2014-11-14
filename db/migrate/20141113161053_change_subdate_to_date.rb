class ChangeSubdateToDate < ActiveRecord::Migration
  def change
  	change_column :subweeks, :subdate, :date
  end
end
