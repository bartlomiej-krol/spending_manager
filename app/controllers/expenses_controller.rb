class ExpensesController < ApplicationController
	before_filter :authorize_signed_in

	def reminders
	  	@user_reminders_show = current_user.expenses.where("status = 'not-paid' AND (reminder_status = 'pending' OR reminder_status = 'remindered') AND date <= '#{DateTime.now}'").order('date DESC')
	end


	def index
		redirect_to lists_path
	end

	def show
		@list = current_user.lists.find(params[:list_id])
		@expense = @list.expenses.find(params[:id])
		if @expense.reminder_status == 'pending'
			@expense.reminder_status = 'remindered'
			@expense.save
		end
	end

	def new
		@list = current_user.lists.find(params[:list_id])
	end

	def create
	  @user = User.find(current_user.id)
	  @expense = @user.lists.find(params[:list_id]).expenses.create(expense_params)
	 
	  @expense.save
	  redirect_to @expense.list
	end

	def edit
		@list = List.find(params[:list_id])
		@expense = @list.expenses.find(params[:id])
	end

	def update
		@user = User.find(current_user.id)
		@list = @user.lists.find(params[:list_id])
	  	@expense = @list.expenses.find(params[:id])

	  	@expense_dup = nil
	  	if @expense.status == 'not-paid'
	  		@expense_dup = @expense.dup
	  	else
			@expense.reminder_status = 'not-remindered'
	  	end
	 
		if @expense.update(expense_params)
			if @expense_dup && @expense.repeatable? && @expense.status == 'paid'
				@expense_dup.date = @expense.date + @expense.repeat_interval
				@expense_dup.reminder_status = 'not-remindered'
				@list.expenses << @expense_dup
				@list.save
			end
	  		redirect_to @expense.list
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(current_user.id)
		@list = @user.lists.find(params[:list_id])
	  	@expense = @list.expenses.find(params[:id])
	  	@expense.destroy
	  	@list.save
	  	redirect_to @list
	end
	 
private
	def expense_params
	    params.require(:expense).permit(:title, :amount, :date, :description, :status, :repeatable, :repeat_interval)
	end

	def authorize_signed_in
		return unless !user_signed_in?
		redirect_to root_path, alert: 'Musisz być zalogowany!'
	end
end
