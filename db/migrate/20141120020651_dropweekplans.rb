class Dropweekplans < ActiveRecord::Migration
  def change
  	drop_table :weekplans
  end
end
