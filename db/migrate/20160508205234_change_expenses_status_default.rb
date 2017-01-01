class ChangeExpensesStatusDefault < ActiveRecord::Migration
  def change
  	change_column :expenses, :status, :string, :default => "paid"
  	change_column :expenses, :type, :string, :default => "normal"
  end
end
