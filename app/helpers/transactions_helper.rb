module TransactionsHelper

  def total(transaction)
    @total = 0
    transaction.all.map do |item|
    @total += item.amount
    end
    @total
  end

  def largest_expense(transaction)
    @expense
    transaction.all.each do |element|
      binding.pry
      @expense << element.amount
    end
    @expense.sort!
  end

end