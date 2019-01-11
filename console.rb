require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

require('pry')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()


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
ticket1 = Ticket.new({'customers_id' => customer1.id, 'films_id' => film1.id})
ticket2 = Ticket.new({'customers_id' => customer2.id, 'films_id' => film2.id})

ticket1.save()
ticket2.save()


binding.pry
nil
