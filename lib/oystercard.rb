class Oystercard
  attr_reader :balance, :MAXIMUM_LIMIT, :in_journey

  MAXIMUM_LIMIT = 90

   def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
  	raise "Exceeded maximum balance!" if limit_exceeded?(amount)

    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

private

  def limit_exceeded?(amount)
    @balance + amount > MAXIMUM_LIMIT
  end

end
