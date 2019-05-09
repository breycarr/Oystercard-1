class Oystercard

  attr_reader :balance, :journey, :journeys

  MAXIMUM_LIMIT = 90
  MINIMUM_LIMIT = 1
  FARE = 3

  def initialize
    @balance = 0
    @journey = {}
    @journeys = []
  end

  def top_up(amount)
  	raise "Exceeded maximum balance!" if limit_exceeded?(amount)

    @balance += amount
  end

  def touch_in(start_station)
    raise "Insufficient funds!" if insufficient_funds
    @journey[:start_station] = start_station
  end

  def touch_out(end_station)
    deduct(FARE)
    @journey[:end_station] = end_station
    @journeys << @journey
    return end_station
  end

  def in_journey?
    !!journey[:start_station] && !journey[:end_station] ? true : false
  end

  def last_journey
    return "No journeys on this card" if journey[:start_station] == nil && journey[:end_station] == nil
    "#{@journey[:start_station]} to #{@journey[:end_station]}"
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
