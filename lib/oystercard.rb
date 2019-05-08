class Oystercard
  attr_reader :balance, :in_journey, :start_station

  MAXIMUM_LIMIT = 90
  MINIMUM_LIMIT = 1
  FARE = 3

   def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
  	raise "Exceeded maximum balance!" if limit_exceeded?(amount)

    @balance += amount
  end

  def touch_in(start_station)
    raise "Insufficient funds!" if insufficient_funds
  
    @in_journey = true
    @start_station = start_station
  end

  def touch_out
    @in_journey = false
    deduct(FARE)
    @start_station = nil
  end
  
private

  def limit_exceeded?(amount)
    @balance + amount > MAXIMUM_LIMIT
  end

  def insufficient_funds
    @balance < MINIMUM_LIMIT
  end

  def deduct(fare)
    @balance -= fare
  end

end
