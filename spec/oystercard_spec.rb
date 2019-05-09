require 'oystercard'
require 'station'

describe Oystercard do
  let(:subject) { Oystercard.new }
  let(:topped_up_card) { Oystercard.new.tap { |card| card.top_up(10)} }
  let(:start_station) { double(:station) }
  let(:end_station) { double(:station) }
  let(:complete_journey_card) { Oystercard.new.tap { |card| card.top_up(5)
                                                            card.touch_in(start_station)
                                                            card.touch_out(end_station) } }

  it 'has 0 balance by default' do
    expect(subject.balance).to eq(0)
  end

  it 'can be topped up' do
    expect{ subject.top_up(10) }.to change{ subject.balance }. by 10
  end

  it 'should raise an error if topping up would exceed limit' do
    expect { subject.top_up(100) }.to raise_error("Exceeded maximum balance!")
  end

  it 'should start not on a journey' do
    expect(topped_up_card.in_journey?).to eq(false)
  end

  describe '#touch_in' do

    it 'should start a journey with #touch_in' do
      expect{ topped_up_card.touch_in(start_station) }.to change{ topped_up_card.in_journey?}.to eq(true)
    end
    it 'should raise an error if there is not enough money in the account' do
      expect { subject.touch_in(start_station) }.to raise_error("Insufficient funds!")
    end

  end

  describe '#touch_out' do

    it 'should end a journey with #touch_out' do
      expect(complete_journey_card.in_journey?).to eq(false)
    end

    it "should deduct a fare at the end of the journey" do
      topped_up_card.touch_in(start_station)
      expect{ topped_up_card.touch_out(end_station) }.to change{ topped_up_card.balance }.by -Oystercard::FARE
    end
  end

  describe "#last_journey" do
    let(:journey) { { start_station: start_station, end_station: end_station } }

    it "should generate an empty list of journeys by default" do
      expect(subject.journey).to be_empty
    end
    it "should return the history of one journey" do
      expect(complete_journey_card.last_journey).to eq("#{start_station} to #{end_station}")
    end
    it "stores a journey" do
      expect(complete_journey_card.journey).to include journey
    end
  end
end
