class ChangeColumnExpenses < ActiveRecord::Migration
  def change
  	change_column :expenses, :repeatable, 'boolean USING CAST(repeatable AS boolean)', :default => false
  end
end
