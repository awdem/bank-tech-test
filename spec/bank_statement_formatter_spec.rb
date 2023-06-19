require 'bank_statement_formatter'

RSpec.describe BankStatementFormatter do
  let(:formatter) { BankStatementFormatter.new }
  it 'constructs' do
    expect(formatter).to be_truthy
  end

  
end

