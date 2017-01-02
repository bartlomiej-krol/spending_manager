class ChangeColumnExpenses < ActiveRecord::Migration
  def change
  	remove_column :expenses, :repeatable
  	add_column :expenses, :repeatable, :boolean, :default => false
  end
end
