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

movie = Movies.new
movie["title"] = "Batman Begins"
movie["year_released"] = "2005"
movie["rated"] = "PG-13"
movie.save

movie = Movies.new
movie["title"] = "The Dark Knight"
movie["year_released"] = "2008"
movie["rated"] = "PG-13"
movie.save

movie = Movies.new
movie["title"] = "The Dark Knight Rises"
movie["year_released"] = "2012"
movie["rated"] = "PG-13"
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

role = Roles.new
role["character_name"] = "Bruce Wayne"
role.save

role = Roles.new
role["character_name"] = "Alfred"
role.save

role = Roles.new
role["character_name"] = "Ra's Al Ghul"
role.save

role = Roles.new
role["character_name"] = "Rachel Dawes"
role.save

role = Roles.new
role["character_name"] = "Commissioner Gordon"
role.save

role = Roles.new
role["character_name"] = "Joker"
role.save

role = Roles.new
role["character_name"] = "Harvey Dent"
role.save

role = Roles.new
role["character_name"] = "Bane"
role.save

role = Roles.new
role["character_name"] = "John Blake"
role.save

role = Roles.new
role["character_name"] = "Selina Kyle"
role.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
