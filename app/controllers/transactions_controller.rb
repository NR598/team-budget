class TransactionsController < ApplicationController

  def index
    if logged_in?
      @transactions = Transaction.all
    else
      redirect_to root_path
    end
  end

  def show
    if logged_in?
      @transactions = Transaction.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def new    
    if logged_in?
      @transactions = Transaction.new
    else
      redirect_to root_path
    end
  end

  def create
    @transactions = Transaction.new(transaction_params)
    @transactions.user_id = session[:user_id]
    if @transactions.save
      redirect_to transaction_path(@transactions)
    else
      render :new
    end
  end

  def edit
    @transactions = Transaction.find(params[:id])
    if authorized_to_edit(@transactions)
    else
      redirect_to transaction_path
    end
  end

  def update
    @transactions = Transaction.find(params[:id])
    if authorized_to_edit(@transactions)
      if @transactions.update(transaction_params)
        redirect_to @transactions
      else
        render :edit
      end
    else
      redirect_to transactions_path
    end
  end

  def destroy
    @transactions = Transaction.find(params[:id])
    if authorized_to_edit(@transactions)
      @transactions.destroy  
      redirect_to transactions_path  
    else
      redirect_to root_path
    end
    
  end

  private
    def transaction_params
      params.require(:transaction).permit(:name,:is_expense, :amount)
    end
end
