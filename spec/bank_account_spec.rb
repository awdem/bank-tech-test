require 'bank_account'
require 'date'

RSpec.describe 'BankAccount class' do
  let(:account) { BankAccount.new }

  it 'constructs' do
    expect(account).to be_truthy
    expect(account.transactions).to eq []
  end

  describe '#deposit' do
    context 'given a positive amount and a date' do
      let(:date) { Date.new(2023, 7, 19) }

      it 'adds a transaction hash to @transactions with the amount and date' do
        account.deposit(500, date)

        expect(account.transactions).to eq [
          { amount: 500.00, date: date }
        ]
      end

      it 'rounds amounts to the hundreth decimal place' do
        account.deposit(500.234, date)

        expect(account.transactions).to eq [
          { amount: 500.23, date: date }
        ]
      end
      it 'rounds amounts up' do
        account.deposit(500.235, date)

        expect(account.transactions).to eq [
          { amount: 500.24, date: date }
        ]
      end
    end

    context 'given a positive amount with no date' do
      xit 'defaults to the current date' do
        # placeholder
      end
    end

    context 'given a negative amount' do
      xit 'raises an error "amount must be above zero"' do
        # placeholder
      end
    end

    context 'given 0' do
      xit 'raises an error "amount must be above zero"' do
        # placeholder
      end
    end
  end
end
