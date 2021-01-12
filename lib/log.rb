class Log
  attr_reader :deposit, :withdrawl, :current_balance, :date

  def initialize(deposit, withdrawl, balance, date = Time.now.strftime('%d/%m/%Y'))
    @deposit = deposit
    @withdrawl = withdrawl
    @current_balance = balance
    @date = date
  end
end
