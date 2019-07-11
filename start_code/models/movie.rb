require_relative('../db/sql_runner.rb')

class Movie

 attr_reader :id
 attr_accessor :title, :genre

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @title = options['title']
    @genre = options['genre']
  end

  def save()
    sql = "INSERT INTO movies(
           title,
           genre
           )
           VALUES ($1, $2)
           RETURNING id"
    values = [@title, @genre]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  # def select()
  #   sql = "SELECT * FROM movies (
  #
  #   )"
  # end

  # def self.all()
  # sql = "SELECT * FROM movies"
  # movies = SqlRunner.run(sql)
  # result = movies.map { |movie| Movie.new( movie ) }
  # return result
  # end

  def self.all()
  sql = "SELECT * FROM movies"
  values = []
  movies = SqlRunner.run(sql, values)
  result = movies.map { |movie| Movie.new( movie ) }
  return result
  end

  def update(id)
    sql = "UPDATE movies SET (
    title,
    genre
    )
    = ($1, $2)
    WHERE id = $3"
    values = [@title, @genre, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end


end
