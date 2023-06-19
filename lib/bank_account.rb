# represents a bank account, keeps track of it's state
class BankAccount
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def deposit(amount, date = Time.now)
    raise 'amount must be above zero' if amount <= 0

    transaction = { amount: amount.round(2), date: date }
    @transactions << transaction
  end

  def withdraw(amount, date = Time.now)
    raise 'amount must be below zero' if amount >= 0

    transaction = { amount: amount.round(2), date: date }
    @transactions << transaction
  end
end
