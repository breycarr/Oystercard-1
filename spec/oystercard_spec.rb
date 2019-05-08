require 'oystercard'

describe Oystercard do
  let(:subject) { Oystercard.new }

  it 'has 0 balance by default' do
    expect(subject.balance).to eq(0)
  end

  it 'can be topped up' do
    expect{ subject.top_up(10) }.to change{ subject.balance }. by 10
  end

  it 'should raise an error if topping up would exceed limit' do
    expect { subject.top_up(100) }.to raise_error("Exceeded maximum balance!")
  end

  it 'should deduct a value from the total balance' do
    subject.top_up(10)
    expect{ subject.deduct(5) }.to change{ subject.balance }.by -5
  end

  it 'should start not on a journey' do
    expect(subject.in_journey).to eq(false)
  end

  it 'should start a journey with #touch_in' do
    expect{ subject.touch_in }.to change{ subject.in_journey}.to eq(true)
  end

  it 'should end a journey with #touch_out' do
    subject.touch_in
    expect{ subject.touch_out }.to change{ subject.in_journey}.to eq(false)
  end

end
