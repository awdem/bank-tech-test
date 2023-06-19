# Produces a formatted bank statement from an array of transactions
class BankStatementFormatter
  def format(transactions)
    formatted_statement = 'date || credit || debit || balance'

    transactions.each do |transaction|
      transaction_date = transaction[:date].strftime('%d/%m/%Y')
      transaction_amount = sprintf('%.2f', transaction[:amount])
      transaction_line = "\n#{transaction_date} || #{transaction_amount} || || #{transaction_amount}"
      formatted_statement << transaction_line
    end

    formatted_statement
  end
end
