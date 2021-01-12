require_relative '../lib/log'

class Account
  attr_accessor :balance

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    deposit = deposit_log(amount)
    push_log(deposit)
  end

  def withdraw(amount)
    raise 'Nice try buddy' unless amount.positive?
    raise 'Insufficient funds' if @balance - amount < 0
    @balance -= amount
    withdraw = withdrawal_log(amount)
    push_log(withdraw)
  end

  def statement
    print "Date made || Deposit || Withdrawl || Balance\n"
    print_log
  end

  private

  def print_log
    @transactions.reverse.each do |i|
      print "#{i.date} || #{format(i.deposit)} || #{format(i.withdrawl)} || #{format(i.current_balance)}\n"
    end
  end

  def format(amount)
    '%.2f' % amount
  end

  def deposit_log(amount)
    Log.new(amount, 0, @balance)
  end

  def withdrawal_log(amount)
    Log.new(0, amount, @balance)
  end

  def push_log(transaction)
    @transactions << transaction
  end
end
