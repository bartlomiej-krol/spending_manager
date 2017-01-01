class RenameTypeExpenses < ActiveRecord::Migration
  def change
  	change_column :expenses, :type, :string, :default => false
  	rename_column :expenses, :type, :repeatable
  end
end
