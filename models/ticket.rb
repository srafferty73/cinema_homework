require_relative('../db/sql_runner')

class Ticket

attr_reader :id
attr_accessor :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customers_id'].to_i
    @film_id = options['films_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets
          (
            customers_id,
            films_id
          )
          VALUES
          (
            $1,$2
          )
          RETURNING id"
    values = [@customer_id, @film_id]
    ticket = SqlRunner.run(sql, values).first
    @id = ticket['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    return tickets.map {|ticket| Ticket.new(ticket)}
  end

  def update()
    sql = "UPDATE ticket
          SET (customers_id, films_id)
          = ($1, $2)
          WHERE id = $3"
    values = [@customer_id, @film_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM tickets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  ##############

  def buy_tickets()
    sql = "SELECT * FROM tickets
          INNER JOIN films ON films.id = tickets.films_id
          INNER JOIN customers ON customers.id = tickets.customers_id
          WHERE tickets.id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values).first
    return result['funds'].to_i - result['price'].to_i
  end

  def update_price()
    sql = "UPDATE customers
          SET funds = $1
          WHERE id = $2"
    values = [buy_tickets(), @customer_id]
    SqlRunner.run(sql, values)
  end

end
