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
NoMethodError (undefined method `top_up' for #<Oystercard:0x00007fcda7999978 @balance=0>) -- define top up method
RSPEC - NoMethodError:
       undefined method `top_up' for #<Oystercard:0x00007fd721163168 @balance=0>
     # ./spec/oystercard_spec.rb:12
```
---

