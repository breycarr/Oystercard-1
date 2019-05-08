class Oystercard
  attr_reader :balance, :MAXIMUM_LIMIT

  MAXIMUM_LIMIT = 90

   def initialize
    @balance = 0
  end
  
  def top_up(amount)
  	raise "Exceeded maximum balance!" if limit_exceeded?(amount)

    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

private 

  def limit_exceeded?(amount)
    @balance + amount > MAXIMUM_LIMIT
  end

end