require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

require('pry')

# customers
customer1 = Customer.new({'name' => 'Arthur Dent', 'funds' => '100'})
customer2 = Customer.new({'name' => 'Betty Boop', 'funds' => '50'})

customer1.save()
customer2.save()

# films
film1 = Film.new({'title' => 'Hitchhikers Guide', 'price' => '15'})
film2 = Film.new({'title' => 'Independence Day', 'price' => '5'})

film1.save()
film2.save()

# tickets
ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id})


binding.pry
nil
