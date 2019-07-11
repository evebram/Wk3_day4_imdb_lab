require_relative('../db/sql_runner.rb')
require_relative('./star.rb')
require_relative('./movie.rb')

class Casting

  attr_reader :id
  attr_accessor :movie_id, :star_id, :fee

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @movie_id = options['movie_id']
    @star_id = options['star_id']
    @fee = options['fee']
  end

  def save()
    sql = "INSERT INTO castings(
           movie_id,
           star_id,
           fee
           )
           VALUES ($1, $2, $3)
           RETURNING id"
    values = [@movie_id, @star_id, @fee]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def self.all()
  sql = "SELECT * FROM castings"
  values = []
  castings = SqlRunner.run(sql, values)
  result = castings.map { |casting| Casting.new(casting) }
  return result
  end

  def update()
    sql = "UPDATE castings SET (
    movie_id,
    star_id,
    fee
    )
    = ($1, $2, $3)
    WHERE id = $4"
    values = [@movie_id, @star_id, @fee, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM castings"
    SqlRunner.run(sql)
  end

end
