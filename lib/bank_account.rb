# represents a bank account, keeps track of its state
class BankAccount
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def deposit(amount, date = Time.now)
    validate(amount)

    add_transaction(amount, date)
  end

  def withdraw(amount, date = Time.now)
    validate(amount)

    add_transaction(-amount, date)
  end

  private

  def add_transaction(amount, date)
    balance = sum_transaction_amounts + amount
    transaction = { amount: amount.round(2), date: date, balance: balance.round(2) }
    @transactions << transaction
  end

  def sum_transaction_amounts
    @transactions.sum { |transaction| transaction[:amount] }
  end

  def validate(amount)
    raise 'amount must be a number' unless amount.is_a?(Numeric)
    raise 'amount must be above zero' if amount <= 0
  end
end
