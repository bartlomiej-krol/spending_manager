class ChangeColumn2Expenses < ActiveRecord::Migration
  def change
  	change_column :expenses, :repeat_interval, :long, :default => 0
  end
end
