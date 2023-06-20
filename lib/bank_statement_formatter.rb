# Produces a formatted bank statement from an array of transactions
class BankStatementFormatter
  def format(transactions)
    formatted_statement = "date || credit || debit || balance\n"

    transactions.reverse.each do |transaction|
      transaction_string = create_transaction_string(transaction)
      formatted_statement << transaction_string
    end

    formatted_statement.chomp
  end

  private

  def create_transaction_string(transaction)
    transaction_date = transaction[:date].strftime('%d/%m/%Y')
    transaction_amount = sprintf('%.2f', transaction[:amount])
    transaction_balance = sprintf('%.2f', transaction[:balance])
    transaction_string = "#{transaction_date} || #{transaction_amount} || || #{transaction_balance}\n"
  end
end
