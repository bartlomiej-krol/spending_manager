class ChangeColumnExpenses < ActiveRecord::Migration
  def change
  	change_column :expenses, :repeatable, 'boolean USING CAST(smoking AS boolean)', :default => false
  end
end
