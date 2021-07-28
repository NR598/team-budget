module TransactionsHelper
  def total(transaction)
    @total = 0
    transaction.all.map do |item|
    @total += item.amount
    end
    @total
  end

end