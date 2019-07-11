require_relative('./models/star.rb')
require_relative('./models/movie.rb')
require_relative('./models/casting.rb')

require('pry-byebug')

  star1 = Star.new({ 'first_name' => 'Jack', 'last_name' => 'Black'})
  star1.save()

  movie1 = Movie.new({ 'title' => 'School of Rock', 'genre' => 'comedy'})
  movie1.save()

  casting1 = Casting.new({ 'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => 6})
  casting1.save()
  casting1.fee = 7
  casting1.update()




binding.pry
nil
