class StatisticsController < ApplicationController
	before_filter :authorize_signed_in

	def index
		only_expenses = true
		if only_expenses then
			@total_sum = current_user.expenses.where("status='paid' AND amount > 0.0").sum(:amount)
			@total_ave = current_user.expenses.where("status='paid' AND amount > 0.0").average(:amount)
			start = (Date.today - 6.days)
			@sum7 = current_user.expenses.where("status='paid' AND date >= '#{start}' AND amount > 0.0").sum(:amount)
			@aved7 = current_user.expenses.where("status='paid' AND date >= '#{start}' AND amount > 0.0").sum(:amount) / 7
			@ave7 = current_user.expenses.where("status='paid' AND date >= '#{start}' AND amount > 0.0").average(:amount)
			
			start = Date.today - (Date.today.day - 1).days
			@sumThisMonth = current_user.expenses.where("status='paid' AND date >= '#{start}' AND amount > 0.0").sum(:amount)
			@avedThisMonth = current_user.expenses.where("status='paid' AND date >= '#{start}' AND amount > 0.0").sum(:amount) / Date.today.day
			@aveThisMonth = current_user.expenses.where("status='paid' AND date >= '#{start}' AND amount > 0.0").average(:amount)

			start = (Date.today - 30.days)
			@sum30 = current_user.expenses.where("status='paid' AND date >= '#{start}' AND amount > 0.0").sum(:amount)
			@aved30 = current_user.expenses.where("status='paid' AND date >= '#{start}' AND amount > 0.0").sum(:amount) / 30
			@ave30 = current_user.expenses.where("status='paid' AND date >= '#{start}' AND amount > 0.0").average(:amount)
		else
			@total_sum = current_user.expenses.where("status='paid'").sum(:amount)
			@total_ave = current_user.expenses.where("status='paid'").average(:amount)
			start = (Date.today - 6.days)
			@sum7 = current_user.expenses.where("status='paid' AND date >= '#{start}'").sum(:amount)
			@aved7 = current_user.expenses.where("status='paid' AND date >= '#{start}'").sum(:amount) / 7
			@ave7 = current_user.expenses.where("status='paid' AND date >= '#{start}'").average(:amount)
			
			start = Date.today - (Date.today.day - 1).days
			@sumThisMonth = current_user.expenses.where("status='paid' AND date >= '#{start}'").sum(:amount)
			@avedThisMonth = current_user.expenses.where("status='paid' AND date >= '#{start}'").sum(:amount) / Date.today.day
			@aveThisMonth = current_user.expenses.where("status='paid' AND date >= '#{start}'").average(:amount)

			start = (Date.today - 30.days)
			@sum30 = current_user.expenses.where("status='paid' AND date >= '#{start}'").sum(:amount)
			@aved30 = current_user.expenses.where("status='paid' AND date >= '#{start}'").sum(:amount) / 30
			@ave30 = current_user.expenses.where("status='paid' AND date >= '#{start}'").average(:amount)
		end
	end

private
	def authorize_signed_in
		return unless !user_signed_in?
		redirect_to root_path, alert: 'Musisz być zalogowany!'
	end
end
