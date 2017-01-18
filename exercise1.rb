class BankAccount

attr_accessor :balance, :interest_rate

  def initialize(balance, interest_rate)
  @balance = balance
  @interest_rate = interest_rate
  end

  def deposit(deposit_amt)
    @balance = @balance + deposit_amt
  end

  def withdraw(withdraw_amt)
    @balance = @balance - withdraw_amt
  end

  def gain_interest
    @balance = @balance * (1+interest_rate)
end

end
