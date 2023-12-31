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

  context 'given a transaction array with one deposit' do
    it 'returns a formatted statement' do
      transactions = [
        { amount: 500, date: Time.new(2023, 7, 19), balance: 500 }
      ]
      formatted_statement = formatter.format(transactions)

      expected_statement = <<~STATEMENT.chomp
        date || credit || debit || balance
        19/07/2023 || 500.00 || || 500.00
      STATEMENT

      expect(formatted_statement).to eq(expected_statement)
    end
  end

  context 'given a transaction array with one withdrawal' do
    it 'returns a formatted statement' do
      transactions = [
        { amount: -500, date: Time.new(2023, 7, 19), balance: -500 }
      ]
      formatted_statement = formatter.format(transactions)

      expected_statement = <<~STATEMENT.chomp
        date || credit || debit || balance
        19/07/2023 || || 500.00 || -500.00
      STATEMENT

      expect(formatted_statement).to eq(expected_statement)
    end
  end

  context 'given a transaction array with multiple deposits' do
    it 'returns a formatted statement in reverse chronological order' do
      transactions = [
        { amount: 500, date: Time.new(2023, 7, 19), balance: 500 },
        { amount: 1000, date: Time.new(2023, 7, 20), balance: 1500 }
      ]
      formatted_statement = formatter.format(transactions)

      expected_statement = <<~STATEMENT.chomp
        date || credit || debit || balance
        20/07/2023 || 1000.00 || || 1500.00
        19/07/2023 || 500.00 || || 500.00
      STATEMENT

      expect(formatted_statement).to eq(expected_statement)
    end
  end

  context 'given a transaction array with deposits and transactions' do
    it 'returns a formatted statement in reverse chronological order' do
      transactions = [
        { amount: 500, date: Time.new(2023, 7, 19), balance: 500 },
        { amount: 1000, date: Time.new(2023, 7, 20), balance: 1500 },
        { amount: -200, date: Time.new(2023, 7, 21), balance: 1300 }
      ]
      formatted_statement = formatter.format(transactions)

      expected_statement = <<~STATEMENT.chomp
        date || credit || debit || balance
        21/07/2023 || || 200.00 || 1300.00
        20/07/2023 || 1000.00 || || 1500.00
        19/07/2023 || 500.00 || || 500.00
      STATEMENT

      expect(formatted_statement).to eq(expected_statement)
    end
  end
end
