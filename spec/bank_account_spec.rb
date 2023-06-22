require 'bank_account'

RSpec.describe 'BankAccount class' do
  let(:account) { BankAccount.new }

  it 'constructs' do
    expect(account).to be_truthy
    expect(account.transactions).to eq []
  end

  describe '#deposit' do
    context 'given a positive amount and a date' do
      let(:date) { Time.new(2023, 7, 19) }

      it 'adds a transaction hash to @transactions with the amount and date' do
        account.deposit(500, date)

        expect(account.transactions).to eq [
          { amount: 500.00, date: date, balance: 500.00 }
        ]
      end

      it 'rounds amount to the hundreth decimal place' do
        account.deposit(500.234, date)

        expect(account.transactions).to eq [
          { amount: 500.23, date: date, balance: 500.23 }
        ]
      end
      it 'rounds amount up' do
        account.deposit(500.235, date)

        expect(account.transactions).to eq [
          { amount: 500.24, date: date, balance: 500.24 }
        ]
      end
    end

    context 'given a positive amount with no date' do
      it 'defaults to the current date' do
        today = Time.new(2023, 7, 19)

        allow(Time).to receive(:now).and_return(today)

        account.deposit(500)

        expect(account.transactions).to eq [
          { amount: 500.00, date: today, balance: 500.00 }
        ]
      end
    end

    context 'given a negative amount' do
      it 'raises an error "amount must be above zero"' do
        expect { account.deposit(-1) }.to raise_error 'amount must be above zero'
      end
    end

    context 'given 0' do
      it 'raises an error "amount must be above zero"' do
        expect { account.deposit(0) }.to raise_error 'amount must be above zero'
      end
    end

    context 'given a non-number' do
      it 'raises an error "amount must be a number"' do
        expect { account.deposit('banana') }.to raise_error 'amount must be a number'
      end
    end
  end

  describe '#withdraw' do
    context 'given a positive amount and a date' do
      let(:date) { Time.new(2023, 7, 19) }

      it 'adds a transaction hash to @transactions with the negative amount and date' do
        account.withdraw(500, date)

        expect(account.transactions).to eq [
          { amount: -500.00, date: date, balance: -500.00 }
        ]
      end

      it 'rounds amount to the hundreth decimal place' do
        account.withdraw(500.234, date)

        expect(account.transactions).to eq [
          { amount: -500.23, date: date, balance: -500.23 }
        ]
      end
      it 'rounds amount up' do
        account.withdraw(500.235, date)

        expect(account.transactions).to eq [
          { amount: -500.24, date: date, balance: -500.24 }
        ]
      end
    end

    context 'given a positive amount with no date' do
      it 'defaults to the current date' do
        today = Time.new(2023, 7, 19)

        allow(Time).to receive(:now).and_return(today)

        account.withdraw(500)

        expect(account.transactions).to eq [
          { amount: -500.00, date: today, balance: -500.00 }
        ]
      end
    end

    context 'given a negative amount' do
      it 'raises an error "amount must be below zero"' do
        expect { account.withdraw(-1) }.to raise_error 'amount must be above zero'
      end
    end

    context 'given 0' do
      it 'raises an error "amount must be below zero"' do
        expect { account.withdraw(0) }.to raise_error 'amount must be above zero'
      end
    end

    context 'given a non-number' do
      it 'raises an error "amount must be a number"' do
        expect { account.withdraw('banana') }.to raise_error 'amount must be a number'
      end
    end
  end

  describe '#get_balance' do
    it 'returns 0 for an account with no transactions' do
      expect(account.get_balance).to eq 0
    end

    it 'returns the balance of an account with several transactions' do
      account.deposit(1000)
      account.withdraw(500)
      account.withdraw(200)

      expect(account.get_balance).to eq 300
    end
  end
end
