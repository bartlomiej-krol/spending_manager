class AddReminderStatusToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :reminder_status, :string, :default => 'not-remindered'
  end
end
