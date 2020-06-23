# Changed by Kirill
movies = { GreenMile: 4, ShapeOfWater: 4, SwampThing: 2, Avengers: 1, Sinister: 3 }

# API

def valid?(rating) #not (a or b) => (not a) and (not b)
  rating >= 1 and rating <= 4
end

def get_rating(movies, title)
  movies[title.to_sym]
end

def exists?(movies, title)
  not movies[title.to_sym].nil?
end

def add_or_update(movies, title, rating)
  movies[title.to_sym] = rating
end

def validate_and_add(movies, title, rating)
  if valid?(rating)
    add_or_update(movies, title, rating)
    return true
  end
  return false
end

# UI layer

def display(movies)
  # high order function / lambda
  movies.each { |movie, rating| puts "#{movie}: #{rating}" }
end

def add(movies)
  puts "Type the name of the movie:"
  title = gets.chomp

  if not exists?(movies, title)
    puts "What is this movie's rating (1 to 4)?"
    rating = gets.chomp.to_i

    if validate_and_add(movies, title, rating)
      puts "#{title} with the rating of #{rating} was added!"
    else
      puts "Rating can only be 1 to 4."      
    end
  else
    puts "This movie already exists. It's rating is #{get_rating(movie, title)}."
  end
end

def update(movies)
  puts "What is the movie title?"
  title = gets.chomp
  if not exists?(movies, title)
    puts "This movie is not yet added."
  else
    puts "What is the new rating?"
    rating = gets.chomp.to_i

    if validate_and_add(movies, title, rating)
      puts "#{title}'s rating was updated to #{rating}."
    else
      puts "Rating can only be 1 to 4."      
    end
  end
end

def delete(movies)
  puts "Which movie would you like to delete?"
  title = gets.chomp
  if not exists?(movies, title)
    puts "This movie does not exist."
  else
    movies.delete(title.to_sym)
    puts "Deleted!"
  end
end

def quit
  puts "Goodbye."
  exit
end

# Application layer

def run_program(movies)
  while true
    puts "--------------------------"
    puts "What would you like to do?" 
    puts "Type" 
    puts "-'add' to add a movie"
    puts "-'update' to update a movie"
    puts "-'display' to see all movies with ratings"
    puts "-'delete' to delete a movie"
    puts "-'quit' to quit"

    choice = gets.chomp
    case choice
    when "add"
      add(movies)
    when "update"
      update(movies)
    when "display"
      display(movies)
    when "delete"
      delete(movies)
    when "quit"
      quit()
    else
      puts "Wot? :/ Try again."   
    end
  end
end

run_program(movies)