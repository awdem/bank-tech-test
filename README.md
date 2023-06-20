# Bank-Tech-Test

Practice tech test for Maker's Academy. A simple bank account program that allows you to make deposits and withdrawals and will print a statement of all the transactions in your account.
Data does not persist between instances of the program running so your transactions will disappear when you close the REPL.

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or Node.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

## Design

![Design Doc](design/class_design.png)

### Modifications/Observations

I made a few modifications to this design during the implementation:

- I did not implement a balance variable or method in BankAccount because I decided it was not in the scope of the specifications.
- The transaction hash now includes the balance of the account after the transaction is added.
- The date parameter in #deposit and #withdraw defaults to the current date/time, but it can also be passed in to mimic the acceptance criteria. This means
  that you could theoretically put in out-of-order transactions that wouldn't properly calculate the account balance, or show up in the right order. If I were to go further with this program, I would control
  user input in a UI class that wouldn't allow custom dates to be passed through to these methods. 

## How to install

In your preferred directory:

```zsh
git clone https://github.com/awdem/bank-tech-test.git
cd bank-tech-test
bundle install
```
## How to run

There is currently no user interface, so you have to interact with the program via irb. To do so, launch irb in your console, then input:

```irb
# the following lines with set up classes for you to test out methods:

require './lib/bank_account.rb'
require './lib/bank_statement_formatter.rb'
account = BankAccount.new
formatter = BankStatementFormatter.new

# You can call deposit and withdraw with a number on account to add transactions to your account.
# To see your statement in the console run:

puts formatter.format(account.transactions) 
```
## How to test:

In the project directory:

To run all tests:
```zsh
rspec
```
To list all tests:
```zsh
rspec -f d
```