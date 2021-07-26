class IncomesController < ApplicationController

  def index
    if logged_in?
      @incomes = Income.all
    else
      redirect_to root_path
    end
  end

  def show
    if logged_in?
      @incomes = Income.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def new    
    if logged_in?
      @incomes = Income.new
    else
      redirect_to root_path
    end
  end

  def create
    @incomes = Income.new(income_params)
    @incomes.user_id = session[:user_id]
    if @incomes.save
      redirect_to income_path(@incomes)
    else
      render :new
    end
  end

  def edit
    @incomes = Income.find(params[:id])
    if authorized_to_edit(@incomes)
    else
      redirect_to income_path
    end
  end

  def update
    @incomes = Income.find(params[:id])
    if authorized_to_edit(@incomes)
      if @incomes.update(income_params)
        redirect_to @incomes
      else
        render :edit
      end
    else
      redirect_to incomes_path
    end
  end

  def destroy
    @incomes = Income.find(params[:id])
    @incomes.destroy

    redirect_to incomes_path
  end

  private
    def income_params
      params.require(:income).permit(:name, :amount, :is_income, :owner)
    end
end