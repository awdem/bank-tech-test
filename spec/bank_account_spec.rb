require 'bank_account'

RSpec.describe 'BankAccount class' do
  let(:account) { BankAccount.new }

  it 'constructs' do
    expect(account).to be_truthy
    expect(account.transactions).to eq []
  end
end
