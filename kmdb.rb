# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Studios.destroy_all
Movies.destroy_all
Actors.destroy_all
Roles.destroy_all

# Generate models and tables, according to the domain model.
# TODO!


# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

studio = Studios.new
studio["name"] = "Warner Bros."
studio.save

#Studio Association
warner_bros = Studios.find_by({"name" => "Warner Bros."})

movie = Movies.new
movie["title"] = "Batman Begins"
movie["year_released"] = "2005"
movie["rated"] = "PG-13"
movie["studio_id"] = Movie.find_by({"studio_id" => warner_bros["id"] })
movie.save

movie = Movies.new
movie["title"] = "The Dark Knight"
movie["year_released"] = "2008"
movie["rated"] = "PG-13"
movie["studio_id"] = Movie.find_by({"studio_id" => warner_bros["id"] })
movie.save

movie = Movies.new
movie["title"] = "The Dark Knight Rises"
movie["year_released"] = "2012"
movie["rated"] = "PG-13"
movie["studio_id"] = Movie.find_by({"studio_id" => warner_bros["id"] })
movie.save

actor = Actors.new
actor["name"] = "Christian Bale"
actor.save

actor = Actors.new
actor["name"] = "Michael Caine"
actor.save

actor = Actors.new
actor["name"] = "Liam Neeson"
actor.save

actor = Actors.new
actor["name"] = "Katie Holmes"
actor.save

actor = Actors.new
actor["name"] = "Gary Oldman"
actor.save

actor = Actors.new
actor["name"] = "Heath Ledger"
actor.save

actor = Actors.new
actor["name"] = "Aaron Eckhart"
actor.save

actor = Actors.new
actor["name"] = "Maggie Gyllenhaal"
actor.save

actor = Actors.new
actor["name"] = "Tom Hardy"
actor.save

actor = Actors.new
actor["name"] = "Joseph Gordon-Levitt"
actor.save

actor = Actors.new
actor["name"] = "Anne Hathaway"
actor.save

#Associating actors and movies for roles
bale = Actor.find_by({"name" => "Christian Bale"})
caine = Actor.find_by({"name" => "Michael Caine"})
neeson = Actor.find_by({"name" => "Liam Neeson"})
holmes = Actor.find_by({"name" => "Katie Holmes"})
oldman = Actor.find_by({"name" => "Gary Oldman"})
ledger = Actor.find_by({"name" => "Heath Ledger"})
eckhart = Actor.find_by({"name" => "Aaron Eckhart"})
gyllenhaal = Actor.find_by({"name" => "Maggie Gyllenhaal"})
hardy = Actor.find_by({"name" => "Tom Hardy"})
jgl = Actor.find_by({"name" => "Joseph Gordon-Levitt"})
hathaway = Actor.find_by({"name" => "Anne Hathaway"})

batman_begins = Movie.find_by({"title" => "Batman Begins"})
dark_knight = Movie.find_by({"title" => "The Dark Knight"})
dark_knight_rises = Movie.find_by({"title" => "The Dark Knight Rises"})

#Batman Begins Roles
role = Roles.new
role["character_name"] = "Bruce Wayne"
role["actor_id"] = Actor.find_by({"actor_id" => bale["id"]})
role["movie_id"] = Movie.find_by({"movie_id" => batman_begins["id"]})
role.save

role = Roles.new
role["character_name"] = "Alfred"
role["actor_id"] = Actor.find_by({"actor_id" => caine["id"]})
role["movie_id"] = Movie.find_by({"movie_id" => batman_begins["id"]})
role.save

role = Roles.new
role["character_name"] = "Ra's Al Ghul"
role["actor_id"] = Actor.find_by({"actor_id" => neeson["id"]})
role["movie_id"] = Movie.find_by({"movie_id" => batman_begins["id"]})
role.save

role = Roles.new
role["character_name"] = "Rachel Dawes"
role["actor_id"] = Actor.find_by({"actor_id" => holmes["id"]})
role["movie_id"] = Movie.find_by({"movie_id" => batman_begins["id"]})
role.save

role = Roles.new
role["character_name"] = "Commissioner Gordon"
role["actor_id"] = Actor.find_by({"actor_id" => oldman["id"]})
role["movie_id"] = Movie.find_by({"movie_id" => batman_begins["id"]})
role.save

#The Dark Knight Roles
role = Roles.new
role["character_name"] = "Bruce Wayne"
role["actor_id"] = Actor.find_by({"actor_id" => bale["id"]})
role["movie_id"] = Movie.find_by({"movie_id" => dark_knight["id"]})
role.save

role = Roles.new
role["character_name"] = "Alfred"
role["actor_id"] = Actor.find_by({"actor_id" => caine["id"]})
role["movie_id"] = Movie.find_by({"movie_id" => dark_knight["id"]})
role.save

role = Roles.new
role["character_name"] = "Rachel Dawes"
role["actor_id"] = Actor.find_by({"actor_id" => gyllenhaal["id"]})
role["movie_id"] = Movie.find_by({"movie_id" => dark_knight["id"]})
role.save

role = Roles.new
role["character_name"] = "Commissioner Gordon"
role["actor_id"] = Actor.find_by({"actor_id" => oldman["id"]})
role["movie_id"] = Movie.find_by({"movie_id" => dark_knight["id"]})
role.save

role = Roles.new
role["character_name"] = "Joker"
role["actor_id"] = Actor.find_by({"actor_id" => ledger["id"]})
role["movie_id"] = Movie.find_by({"movie_id" => dark_knight["id"]})
role.save

role = Roles.new
role["character_name"] = "Harvey Dent"
role["actor_id"] = Actor.find_by({"actor_id" => eckhart["id"]})
role["movie_id"] = Movie.find_by({"movie_id" => dark_knight["id"]})
role.save

#The Dark Knight Rises Roles
role = Roles.new
role["character_name"] = "Bruce Wayne"
role["actor_id"] = Actor.find_by({"actor_id" => bale["id"]})
role["movie_id"] = Movie.find_by({"movie_id" => dark_knight_rises["id"]})
role.save

role = Roles.new
role["character_name"] = "Alfred"
role["actor_id"] = Actor.find_by({"actor_id" => caine["id"]})
role["movie_id"] = Movie.find_by({"movie_id" => dark_knight_rises["id"]})
role.save

role = Roles.new
role["character_name"] = "Commissioner Gordon"
role["actor_id"] = Actor.find_by({"actor_id" => oldman["id"]})
role["movie_id"] = Movie.find_by({"movie_id" => dark_knight_rises["id"]})
role.save

role = Roles.new
role["character_name"] = "Bane"
role["actor_id"] = Actor.find_by({"actor_id" => hardy["id"]})
role["movie_id"] = Movie.find_by({"movie_id" => dark_knight_rises["id"]})
role.save

role = Roles.new
role["character_name"] = "John Blake"
role["actor_id"] = Actor.find_by({"actor_id" => jgl["id"]})
role["movie_id"] = Movie.find_by({"movie_id" => dark_knight_rises["id"]})
role.save

role = Roles.new
role["character_name"] = "Selina Kyle"
role["actor_id"] = Actor.find_by({"actor_id" => hathaway["id"]})
role["movie_id"] = Movie.find_by({"movie_id" => dark_knight_rises["id"]})
role.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!
for movie in movies
    puts "#{movie["title"]} #{movie["year_released"} #{movie["rated"]} #{movie["studio_id"]}"

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
