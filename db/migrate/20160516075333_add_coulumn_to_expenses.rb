class AddCoulumnToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :repeat_interval, :integer, :default => 0
  end
end
