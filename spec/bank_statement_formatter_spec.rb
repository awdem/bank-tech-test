require 'bank_statement_formatter'

RSpec.describe BankStatementFormatter do
  let(:formatter) { BankStatementFormatter.new }
  it 'constructs' do
    expect(formatter).to be_truthy
  end

  context 'given an empty transaction array' do
    it 'returns an empty statement' do
      transactions = []
      formatted_statement = formatter.format(transactions)

      expected_statement = <<~STATEMENT.chomp
        date || credit || debit || balance
      STATEMENT

      expect(formatted_statement).to eq(expected_statement)
    end
  end

  context 'given a transaction array with one transacation' do
    it 'returns a formatted statement' do
      transactions = [
        { amount: 500, date: Time.new(2023, 7, 19) }
      ]
      formatted_statement = formatter.format(transactions)

      expected_statement = <<~STATEMENT.chomp
        date || credit || debit || balance
        19/07/2023 || 500.00 || || 500.00
      STATEMENT

      expect(formatted_statement).to eq(expected_statement)
    end
  end
end
