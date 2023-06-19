# represents a bank account, keeps track of it's state
class BankAccount
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def deposit(amount, date)
    transaction = { amount: amount.round(2), date: date }
    @transactions << transaction
  end
end
