module TransactionsHelper

  def total(transaction)
    @total = 0
    transaction.all.map do |item|
    @total += item.amount
    end
    @total
  end

  def largest_expense(transaction)
    income = transaction.order(:amount).first.amount
  end

  # def largest_income(transaction)
  #   @income = []
  #   transaction.map do |element|     
  #     @income.push(element.amount)  
  #   end
  #   @income.sort!
  #   @income[-1]
  # end

  def largest_income(transaction)
    income = transaction.order(:amount).last.amount
  end

  def user_with_largest_expense(transaction)
    user = transaction.order(:amount).first
    user.user.name  
  end

  def user_with_largest_income(transaction)
    user = transaction.order(:amount).last
    user.user.name  
  end
end

