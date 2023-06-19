require 'bank_account'
require 'bank_statement_formatter'

RSpec.describe 'Integration' do
  context 'given several dated deposits and one withdrawal' do
    xit 'returns a multi-line string of the bank statement' do
      account = BankAccount.new

      account.deposit(1000, Time.new(2023, 1, 10))
      account.deposit(2000, Time.new(2023, 1, 13))
      account.withdraw(500, Time.new(2023, 1, 14))

      formatter = BankStatementFormatter.new

      formatted_statement = formatter.format(account.transactions)

      expected_statement = <<~STATEMENT.chomp
        date || credit || debit || balance
        14/01/2023 || || 500.00 || 2500.00
        13/01/2023 || 2000.00 || || 3000.00
        10/01/2023 || 1000.00 || || 1000.00
      STATEMENT

      expect(formatted_statement).to eq(expected_statement)
    end
  end
end
