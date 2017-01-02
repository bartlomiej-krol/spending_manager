class ChangeColumn2Expenses < ActiveRecord::Migration
  def change
  	change_column :expenses, :repeat_interval, :bigint, :default => 0
  end
end
