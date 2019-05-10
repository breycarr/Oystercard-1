# Oystercard challenge

This week's challenge will start with going back over the basics we covered last week in Boris Bikes, giving you the chance to reinforce what you learned last week. You'll then be challenged to build a more complex system which should really stretch your skills in Ruby, TDD and object-oriented design.

## Focus goals
Mindful engagement with these challenges can help you achieve these goals:

### I write code that is easy to change

Writing easy to change software is highly prized amongst developers and employers. By developers because most of a developer's time is spent changing software. By employers because their teams can deliver value to customers faster.

### I can test-drive my code
Tested software is easier to change because you can tell when it's broken just by running a command, even the tricky edge cases.

### I can build with objects
Most code in the world is structured in small pieces called objects. This is done because it is easier to change than having everything in one place.

## APPROACH

IRB Feature Test - Create a new Oystercard
First Error:
NameError ./spec/oystercard_spec.rb:1 -- create Oystercard class

### USER STORIES

```
In order to use public transport
As a customer
I want money on my card
```
Objects | Messages
-|-
card  |  has_money
customer  |  

Error:
```
NoMethodError  ./spec/oystercard_spec.rb:6 -- define default balance
```
---

```
In order to keep using public transport
As a customer
I want to add money to my card
```
Objects | Messages
-|-
card  |  add money
customer  |

```
irb: card = Oystercard.new
irb: card.top_up(10)
```

Errors - IRB
```
NoMethodError (undefined method `top_up' for #<Oystercard:0x00007fcda7999978 @balance=0>) -- define top up method
RSPEC - NoMethodError:
       undefined method `top_up' for #<Oystercard:0x00007fd721163168 @balance=0>
     # ./spec/oystercard_spec.rb:12
```
---

```
In order to protect my money from theft or loss
As a customer
I want a maximum limit (of £90) on my card
```

Objects | Messages
-|-
card  |  has maximum limit
customer  |

```
irb: card = Oystercard.new
irb: card.top_up(100)
```

Error - RSPEC
```
Failure/Error: expect { card.top_up(100) }.to raise_error('Exceeded maximum balance')
       expected Exception with "Exceeded maximum balance" but nothing was raised
     # ./spec/oystercard_spec.rb:18
```

IRB Feature Test:

```
2.6.0 :001 > require './lib/oystercard'
 => true
2.6.0 :002 > card = Oystercard.new
 => #<Oystercard:0x00007fd21e89e408 @balance=0>
2.6.0 :003 > card.top_up(100)
Traceback (most recent call last):
        5: from /Users/student/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        4: from /Users/student/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        3: from /Users/student/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):3
        1: from /Users/student/Projects/oystercard/lib/oystercard.rb:12:in `top_up'
RuntimeError (Balance can't be more than 90)
```
---

```
In order to pay for my journey
As a customer
I need my fare deducted from my card
```

Objects | Messages
-|-
card | deduct(value)

IRB Error:
```
NoMethodError (undefined method `deduct' for #<Oystercard:0x00007ffb2a8de5c8 @balance=10>)
```
Rspec Error:
```
Failure/Error: subject.deduct(5)

     NoMethodError:
       undefined method `deduct' for #<Oystercard:0x00007ffaa72433b8 @balance=10>
     # ./spec/oystercard_spec.rb:21
```

IRB Feature Test:
```
2.6.0 :001 > require './lib/oystercard.rb'
 => true
2.6.0 :002 > card = Oystercard.new
 => #<Oystercard:0x00007fb5fd8351e8 @balance=0>
2.6.0 :003 > card.top_up(10)
 => 10
2.6.0 :004 > card.deduct(5)
 => 5
2.6.0 :005 > card.balance
 => 5
 ```

---

```
In order to get through the barriers.
As a customer
I need to touch in and out.
```

Objects | Messages
-|-
card | touch_in
card | touch_out
card | in_journey?

IRB Errors:
```
NoMethodError (undefined method `in_journey?' for #<Oystercard:0x00007ff0ab2eb118 @balance=0>)
```
```
NoMethodError (undefined method `touch_in' for #<Oystercard:0x00007ff0ab2eb118 @balance=0>)
```
```
NoMethodError (undefined method `touch_out' for #<Oystercard:0x00007ff0ab2eb118 @balance=0>)
```

Rspec Errors - in_journey?:
```
Failure/Error: expect(subject.in_journey?).to eq(false)

     NoMethodError:
       undefined method `in_journey?' for #<Oystercard:0x00007fadf3a43578 @balance=0>
     # ./spec/oystercard_spec.rb:24
```
```
Failure/Error: expect(subject.in_journey?).to eq(false)

       expected: false
            got: nil

       (compared using ==)
     # ./spec/oystercard_spec.rb:24
```

Rspec Errors - touch_in:
```
Failure/Error: subject.touch_in

     NoMethodError:
       undefined method `touch_in' for #<Oystercard:0x00007f97e3252ad8 @balance=0>
     # ./spec/oystercard_spec.rb:28
```
```
Failure/Error: expect(subject.in_journey?).to eq(true)

       expected: true
            got: false

       (compared using ==)
     # ./spec/oystercard_spec.rb:29
```
Rspec Errors - touch_out:
```
Failure/Error: subject.touch_out

     NoMethodError:
       undefined method `touch_out' for #<Oystercard:0x00007fbf72268de0 @balance=0, @in_journey=true>
       Did you mean?  touch_in
     # ./spec/oystercard_spec.rb:34
```
```
Failure/Error: expect(subject.in_journey).to eq(false)

       expected: false
            got: true

       (compared using ==)
     # ./spec/oystercard_spec.rb:35
```

IRB feature test:
```
2.6.0 :001 > require './lib/oystercard.rb'
 => true
2.6.0 :002 > card = Oystercard.new
 => #<Oystercard:0x00007fd6b40fec08 @balance=0, @in_journey=false>
2.6.0 :003 > card.in_journey
 => false
2.6.0 :004 > card.touch_in
 => true
2.6.0 :005 > card.in_journey
 => true
2.6.0 :006 > card.touch_out
 => false
 ```

 ---

```
In order to pay for my journey
As a customer
I need to have the minimum amount (£1) for a single journey.
```
Objects | Methods
-|-
card | minimum_amount


Rspec Errors:
```
Failure/Error: expect { subject.touch_in }.to raise_error("Insufficient funds!")
       expected Exception with "Insufficient funds!" but nothing was raised
     # ./spec/oystercard_spec.rb:33
```
```
Failure/Error: raise "Insufficient funds!" if @balance < 1

     RuntimeError:
       Insufficient funds!
     # ./lib/oystercard.rb:22
```

IRB Feature Test:

```
2.6.0 :00require './lib/oystercard.rb'
 => true
2.6.0 :002 > card = Oystercard.new
 => #<Oystercard:0x00007fa7f3977848 @balance=0, @in_journey=false>
2.6.0 :003 > card.touch_in
Traceback (most recent call last):
        5: from /Users/kiri/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        4: from /Users/kiri/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        3: from /Users/kiri/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):3
        1: from /Users/kiri/Documents/GitHub/Oystercard/lib/oystercard.rb:22:in `touch_in'
RuntimeError (Insufficient funds!)
2.6.0 :004 > card.top_up(4)
 => 4
2.6.0 :005 > card.touch_in
 => true
```
---

```
In order to pay for my journey
As a customer
When my journey is complete, I need the correct amount deducted from my card
```

Object | Message
-|-
card | deduct
correct amount | deduct

IRB error - card balance should change after touch in and touch out called:
```
2.6.0 :001 > require './lib/oystercard.rb'
 => true
2.6.0 :002 > card = Oystercard.new
 => #<Oystercard:0x00007f872993eab0 @balance=0, @in_journey=false>
2.6.0 :003 > card.top_up(10)
 => 10
2.6.0 :004 > card.touch_in
 => true
2.6.0 :005 > card.touch_out
 => false
2.6.0 :006 > card.balance
 => 10
```
Rspec Error:
```
Failure/Error: expect{ topped_up_card.touch_out }.to change{ topped_up_card.balance }.by -3
       expected `topped_up_card.balance` to have changed by -3, but was changed by 0
     # ./spec/oystercard_spec.rb:47
```
IRB Feature Test:
```
raceback (most recent call last):
        6: from /Users/kiri/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        5: from /Users/kiri/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        4: from /Users/kiri/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        3: from (irb):2
        2: from /Users/kiri/.rvm/rubies/ruby-2.6.0/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
        1: from /Users/kiri/.rvm/rubies/ruby-2.6.0/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
LoadError (cannot load such file -- ./lib/station.rb)
```

Rspec Errors:
```
Failure/Error:
  describe Station do

  end

NameError:
  uninitialized constant Station
# ./spec/station_spec.rb:1
```

```
Failure/Error: expect{ topped_up_card.touch_in }.to change{ topped_up_card.start_station }.to eq start_station

     NoMethodError:
       undefined method `start_station' for #<Oystercard:0x00007f974faa2970 @balance=10, @in_journey=false>
     # ./spec/oystercard_spec.rb:40
```

```
Failure/Error: expect{ topped_up_card.touch_in(start_station) }.to change{ topped_up_card.start_station }.to eq start_station
       expected `topped_up_card.start_station` to have changed to eq #<Station:0x00007ffc0c97e720>, but did not change
     # ./spec/oystercard_spec.rb:40
```

```
Failure/Error: expect{ topped_up_card.touch_out }.to change{ topped_up_card.start_station }.to eq nil
       expected `topped_up_card.start_station` to have changed to eq nil, but did not change
     # ./spec/oystercard_spec.rb:58
```
---
```
In order to know where I have been
As a customer
I want to see all my previous trips
```

Objects | Messages
-|-
Card | journey_history

IRB tests
```
irb
require './lib/oystercard.rb'
card = Oystercard.new
card.top_up(5)
card.touch_in("Angel")
card.touch_out("Aldgate")
card.journey_history
```
---

```
In order to know how far I have travelled
As a customer
I want to know what zone a station is in
```

Objects | Messages
-|-
Station | zone?

IRB tests
```
require './lib/oystercard.rb'
stations = Station.new('Angel', 2)
station.name
station.zone?
```
