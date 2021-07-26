class ExpensesController < ApplicationController

  def index
    if logged_in?
      @expenses = Expense.all
    else
      redirect_to root_path
    end
  end

  def show
    if logged_in?
      @expenses = Expense.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def new    
    if logged_in?
      @expenses = Expense.new
    else
      redirect_to root_path
    end
  end

  def create
    @expenses = Expense.new(expense_params)
    @expenses.user_id = session[:user_id]
    if @expenses.save
      redirect_to expense_path(@expenses)
    else
      render :new
    end
  end

  def edit
    @expenses = Expense.find(params[:id])
    if authorized_to_edit(@expenses)
    else
      redirect_to expense_path
    end
  end

  def update
    @expenses = Expense.find(params[:id])
    if authorized_to_edit(@expenses)
      if @expenses.update(expense_params)
        redirect_to @expenses
      else
        render :edit
      end
    else
      redirect_to expenses_path
    end
  end

  def destroy
    @expenses = Expense.find(params[:id])
    if authorized_to_edit(@expenses)
      @expenses.destroy  
      redirect_to expenses_path  
    else
      redirect_to root_path
    end
    
  end

  private
    def expense_params
      params.require(:expense).permit(:name, :amount,)
    end
end
