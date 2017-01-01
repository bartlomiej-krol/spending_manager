class ChangeColumnExpenses < ActiveRecord::Migration
  def change
  	change_column :expenses, :repeatable, :boolean, :default => false
  end
end
