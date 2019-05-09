require 'oystercard'
require 'station'

describe Oystercard do
  let(:subject) { Oystercard.new }
  let(:topped_up_card) { Oystercard.new.tap { |card| card.top_up(10)}}
  let(:station) { double(:station)}

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
      expect{ topped_up_card.touch_in(station) }.to change{ topped_up_card.in_journey?}.to eq(true)
    end
    it 'should raise an error if there is not enough money in the account' do
      expect { subject.touch_in(station) }.to raise_error("Insufficient funds!")
    end

    it 'should record the starting station' do
      expect{ topped_up_card.touch_in(station) }.to change{ topped_up_card.start_station }.to eq station
    end

  end

  describe '#touch_out' do

    it 'should end a journey with #touch_out' do
      topped_up_card.touch_in(station)
      expect{ topped_up_card.touch_out }.to change{ topped_up_card.in_journey?}.to eq(false)
    end

    it "should deduct a fare at the end of the journey" do
      topped_up_card.touch_in(station)
      expect{ topped_up_card.touch_out }.to change{ topped_up_card.balance }.by -Oystercard::FARE
    end

    it 'should make the card forget the start station' do
       topped_up_card.touch_in(station)
       expect{ topped_up_card.touch_out }.to change{ topped_up_card.start_station }.to eq nil
    end

  end
end
