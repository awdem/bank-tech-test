# represents a bank account, keeps track of it's state
class BankAccount
  attr_reader :transactions

  def initialize
    @transactions = []
  end
end
