# represents a bank account, keeps track of it's state
class BankAccount
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def deposit(amount, date = Time.now)
    raise 'amount must be above zero' if amount <= 0

    add_transaction(amount, date)
  end

  def withdraw(amount, date = Time.now)
    raise 'amount must be above zero' if amount <= 0

    add_transaction(-amount, date)
  end

  private 

  def add_transaction(amount, date)
    balance = self.sum_transaction_amounts + amount
    transaction = { amount: amount.round(2), date: date, balance: balance.round(2) }
    @transactions << transaction
  end

  def sum_transaction_amounts
    @transactions.sum { |transaction| transaction[:amount]}
  end
end
