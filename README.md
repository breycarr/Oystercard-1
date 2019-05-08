Oystercard challenge

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
NoMethodError:
       undefined method `top_up' for #<Oystercard:0x00007fb1849ddf40 @balance=0>
     # ./spec/oystercard_spec.rb:11
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
Failure/Error: expect { subject.top_up(100) }.to raise_error("Exceeded maximum balance!")
       expected Exception with "Exceeded maximum balance!" but nothing was raised
     # ./spec/oystercard_spec.rb:16
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
RuntimeError (Exceeded maximum balance!)
```