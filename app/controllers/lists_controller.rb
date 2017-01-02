class ListsController < ApplicationController
	before_filter :authorize_signed_in

	def index
		@user = User.find(current_user.id)
		@lists = @user.lists
	end

	def show
		@list = List.find(params[:id])
		@list_paid_expenses = @list.expenses.where("status = 'paid'").order('date DESC')
		@list_not_paid_expenses = @list.expenses.where("status = 'not-paid'").order('date ASC')
		@list_other_expenses = @list.expenses.where("status IS NULL OR status NOT IN ('paid', 'not-paid')").order('date ASC')
	end

	def new
	end

	def create
	  @user = User.find(current_user.id)
	  @list = @user.lists.create(list_params)
	 
	  @list.save
	  redirect_to @list
	end
	 
private
	def list_params
	    params.require(:list).permit(:name)
	end

	def authorize_signed_in
		return unless !user_signed_in?
		redirect_to root_path, alert: 'Musisz być zalogowany!'
	end
end
