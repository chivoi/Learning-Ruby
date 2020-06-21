movies = {GreenMile: 4, ShapeOfWater: 4, SwampThing: 2, Avengers: 1, Sinister: 3}


puts "What would you like to do?" 
loop do 
puts "Type" 
puts "-'add' to add a movie"
puts "-'update' to update a movie"
puts "-'display' to see all movies with ratings"
puts "-'delete' to delete a movie"

choice = gets.chomp

case choice
  when "add"
    puts "Type the name of the movie:"
    title = gets.chomp
    if
      movies[title.to_sym].nil?
      puts "What is this movie's rating (1 to 4)?"
      rating = gets.chomp
        if rating.to_i > 4 or rating.to_i < 1
          puts "Rating can only be 1 to 4."
        else
            movies[title.to_sym] = rating.to_i
            puts "#{title} with the rating of #{rating} was added!"
        end
    else
      puts "This movie already exists. It's rating is #{movies[title.to_sym]}."
    end
  when "update"
    puts "What is the movie title?"
    title = gets.chomp
    if
      movies[title.to_sym].nil?
      puts "This movie is not yet added."
    else
      puts "What is the new rating?"
      rating = gets.chomp
      if rating.to_i > 4 or rating.to_i < 1
        puts "Rating can only be 1 to 4."
      else
        movies[title.to_sym] = rating.to_i
        puts "#{title}'s rating was updated to #{rating}."
      end
    end
  when "display"
    movies.each{|movie, rating| puts "#{movie}: #{rating}"}
  when "delete"
    puts "Which movie would you like to delete?"
    title = gets.chomp
    if 
      movies[title.to_sym].nil?
      puts "This movie does not exist."
    else
      movies.delete(title.to_sym)
      puts "Deleted!"
    end
  else
    puts "Wot? :/ Try again."   
  end
end
