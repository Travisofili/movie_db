# Movie DB

Model the relationships between Actors and the different roles they have with the movies they work on.

## Scenarios to consider for design.

1. An actor can star in many movies; sometimes they can play multiple characters in the same movie (think Eddie Murphy in The Nutty Professor, where he plays 7 characters).
2. An actor can direct many movies; they can also star in the movie they're directing (think Ben Affleck in Argo).
3. An actor can write the screenplay for many movies, they can also star in the movie they wrote the screenplay for (think Matt Damon and Ben Affleck in Good Will Hunting).

## Implemented solution.

The initial implementation uses join tables to connect Actors and Movies. 

Consider the scenario where an Actor Stars in a movie. It makes sense to have a Star model that has the foreign keys actor_id and movie_id so that the has_many through association can be used. Now consider the case when an actor has multiple characters in the same move. To keep track of the characters an actor plays in a movie it makes sense to add a character attribute to the Star model so that each pairing of actor and movie through the join table is associated with a character in that specific movie.

Now consider the second scenario where an Actor can direct a movie. Making a Directorship model that has the foreign keys actor_id and movie_id made sense in this case. This allows for the use of the has_many through association when going from Actors to Movies and the has_one through association when going from Movies to Actors. Here is the motivation: an Actor can have many movies as a director, hence has_many through; a movie has only one director, who in this case is an actor. Now if we consider that an Actor can Star in the same movie that they are directing, the Star model keeps track of the character the actor plays and the Directorship model keeps track of the fact that they are also directing the movie.

The third scenario makes the case for Actors who write Screenplays. The implementation of this scenario is similar to that of the second scenario with one exception, the association used when going from movies to actors. Since a movie can have multiple writers, it made more sense to use the has_many through association when going from movies to actors as opposed to using has_one through. Again, the Star model can be used to keep track of the characters an actor plays in the movie that they wrote, while the Screenplay model keeps track of the fact that they wrote the movie.

## Reflection

While looking at the problem of modelling the relationships between actors and movies I started to think about how this basic structure could be expanded to include other people who are not actors but do direct, write, or both. When taking this into consideration, it might make more sense to have a polymorphic association when it comes to directing and writing movies. This particular implementation might look something like this:

```
class Actor < ActiveRecord::Base
  has_many :movies, as: :directable
  has_many :movies, as: :writeable
end

class Movie < ActiveRecord::Base
  belongs_to :directable, polymorphic: true
  belongs_to :writeable, polymorphic: true
end
```

While this implementation would also have it's own difficulties, it would allow for other models representing directors and writers to access the Movie model using a single association rather than continuing to add more associations for the additional models.