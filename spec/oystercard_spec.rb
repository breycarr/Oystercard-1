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

end