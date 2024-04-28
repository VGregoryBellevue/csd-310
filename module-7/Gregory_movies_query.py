import mysql.connector

# Connect to the database
conn = mysql.connector.connect(
    host="localhost",
    user="movies_user",
    password="popcorn",
    database="movies"
)

# Check if the connection is successful
if conn.is_connected():
    print("Connected to the database")
else:
    print("Failed to connect to the database")

# Create cursor only if the connection is successful
if conn.is_connected():
    cursor = conn.cursor()

    # Query 1: Select all fields for the studio table
    query1 = "SELECT * FROM studio"
    cursor.execute(query1)
    studio_results = cursor.fetchall()
    print("Studio Table:")
    for studio in studio_results:
        print(studio)

    # Query 2: Select all fields for the genre table
    query2 = "SELECT * FROM genre"
    cursor.execute(query2)
    genre_results = cursor.fetchall()
    print("\nGenre Table:")
    for genre in genre_results:
        print(genre)

    # Query 3: Select movie names for movies with a runtime of less than two hours
    query3 = "SELECT film_name FROM film WHERE film_runtime < 120"
    cursor.execute(query3)
    movie_results = cursor.fetchall()
    print("\nMovies with Runtime Less Than Two Hours:")
    for movie in movie_results:
        print(movie[0])

    # Query 4: Get a list of film names and directors grouped by director
    query4 = "SELECT film_name, film_director FROM film GROUP BY film_name, film_director"
    cursor.execute(query4)
    director_results = cursor.fetchall()
    print("\nFilms Grouped by Director:")
    for director in director_results:
        print(director)

    # Close the connection
    conn.close()
