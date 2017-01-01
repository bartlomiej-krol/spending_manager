class Expense < ActiveRecord::Base
  belongs_to :list

  REPEAT_INTERVALS = [{val: 1.day, text: "1 day"},
  					{val: 7.days, text: "7 days"},
  					{val: 1.month, text: "1 month"},
  					{val: 3.months, text: "3 months"},
  					{val: 6.months, text: "6 months"},
  					{val: 1.year, text: "1 year"}]


  def checkReminders
  	@reminders = Expense.where("`status` = 'not-paid' AND (`reminder_status` IS NULL OR `reminder_status` = 'not-remindered')")
  	@reminders.each do |reminder|
  		reminder.reminder_status = 'pending'
  		reminder.save
  	end
  end
end
