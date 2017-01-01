class SpendingsController < ApplicationController 
	def index
		@spendings = Spending.all
	end

	def show
		@spending = Spending.find(params[:id])
	end

	def new
	end

	def create
	  @spending = Spending.new(spending_params)
	 
	  @spending.save
	  redirect_to @spending
	end
	 
private
	def spending_params
	    params.require(:spending).permit(:spending_name, :value)
	end
end
