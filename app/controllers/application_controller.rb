class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  before_filter :checkReminders, if: :user_signed_in?


  private
	def checkReminders
	  	@reminders = Expense.where("status = 'not-paid' AND (reminder_status IS NULL OR reminder_status = 'not-remindered') AND date <= '#{DateTime.now}'::datetime")
	  	@reminders = Expense.where("1=0")
	  	@reminders.each do |reminder|
	  		reminder.reminder_status = 'pending'
	  		reminder.save
	  	end
	  	@user_reminders = current_user.expenses.where("reminder_status = 'pending'")
  	end
end
