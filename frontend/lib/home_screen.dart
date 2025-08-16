import 'package:flutter/material.dart';
import 'movie_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkMoviesApp extends StatelessWidget {
  DarkMoviesApp({super.key});

  final List<Map<String, dynamic>> movies = [
    {
      "title": "Inception",
      "summary": "A thief enters dreams to steal secrets.",
      "image_url":
      "https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_.jpg"
    },
    {
      "title": "The Batman",
      "summary": "Batman fights crime and corruption in Gotham.",
      "image_url":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrzzFYczgufsR1VZbadYvtIvRKYnNnb8tz9w&s"
    },
    {
      "title": "The Incredible Hulk",
      "summary":
      "Bruce Banner, a scientist on the run from the U.S. Government, must find a cure for the monster he turns into whenever he loses his temper.",
      "image_url":
      "https://m.media-amazon.com/images/M/MV5BMTUyNzk3MjA1OF5BMl5BanBnXkFtZTcwMTE1Njg2MQ@@._V1_.jpg"
    },
    {
      "title": "The Shawshank Redemption",
      "summary":
      "A banker convicted of uxoricide forms a friendship over a quarter century with a hardened convict, while maintaining his innocence and trying to remain hopeful through simple compassion.",
      "image_url":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQb9670Mi_MG5ezDhuF-mDPXtisIFZZPiHyzw&s"
    },
    {
      "title": "The Godfather",
      "summary":
      "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
      "image_url":
      "https://m.media-amazon.com/images/M/MV5BNGEwYjgwOGQtYjg5ZS00Njc1LTk2ZGEtM2QwZWQ2NjdhZTE5XkEyXkFqcGc@._V1_.jpg"
    },
    {
      "title": "The Dark Knight",
      "summary":
      "When a menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman, James Gordon and Harvey Dent must work together to put an end to the madness.",
      "image_url":
      "https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_FMjpg_UX1000_.jpg"
    },
    {
      "title": "Fight Club",
      "summary":
      "An insomniac office worker and a devil-may-care soap maker form an underground fight club that evolves into much more.",
      "image_url":
      "https://m.media-amazon.com/images/M/MV5BOTgyOGQ1NDItNGU3Ny00MjU3LTg2YWEtNmEyYjBiMjI1Y2M5XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg"
    },
    {
      "title": "The Matrix",
      "summary":
      "When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the shocking truth--the life he knows is the elaborate deception of an evil cyber-intelligence.",
      "image_url":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfSjSWOCaw5dnDL2GT1zFd9RMCgUGw5Q2Cfg&s"
    },
    {
      "title": "Terminator 2: Judgment Day",
      "summary":
      "A cyborg, identical to the one who failed to kill Sarah Connor, must now protect her ten year old son John from an even more advanced and powerful cyborg.",
      "image_url":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdiiEkFxkev2ZCxNl25GG7Pq-VFTvdzsZXXg&s"
    },
    {
      "title": "The Lord of the Rings: The Return of the King",
      "summary":
      "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.",
      "image_url":
      "https://m.media-amazon.com/images/M/MV5BMTZkMjBjNWMtZGI5OC00MGU0LTk4ZTItODg2NWM3NTVmNWQ4XkEyXkFqcGc@._V1_.jpg"
    }, {
      "title": "Interstellar",
      "summary":
      "When Earth becomes uninhabitable in the future, a farmer and ex-NASA pilot, Joseph Cooper, is tasked to pilot a spacecraft, along with a team of researchers, to find a new planet for humans.",
      "image_url":
      "https://upload.wikimedia.org/wikipedia/en/b/bc/Interstellar_film_poster.jpg"
    }, {
      "title": "Se7en",
      "summary":
      "Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his motives.",
      "image_url":
      "https://m.media-amazon.com/images/M/MV5BY2IzNzMxZjctZjUxZi00YzAxLTk3ZjMtODFjODdhMDU5NDM1XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg"
    }, {
      "title": "Gladiator",
      "summary":
      "A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.",
      "image_url":
      "https://upload.wikimedia.org/wikipedia/en/f/fb/Gladiator_%282000_film_poster%29.png"
    }, {
      "title": "Avengers: Infinity War",
      "summary":
      "The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the powerful Thanos before his blitz of devastation and ruin puts an end to the universe.",
      "image_url":
      "https://m.media-amazon.com/images/M/MV5BMjMxNjY2MDU1OV5BMl5BanBnXkFtZTgwNzY1MTUwNTM@._V1_FMjpg_UX1000_.jpg"
    }, {
      "title": "The Wild Robot",
      "summary":
      "After a shipwreck, an intelligent robot called Roz is stranded on an uninhabited island. To survive the harsh environment, Roz bonds with the island's animals and cares for an orphaned baby goose.",
      "image_url":
      "https://upload.wikimedia.org/wikipedia/en/thumb/7/70/The_Wild_Robot_poster.jpg/250px-The_Wild_Robot_poster.jpg"
    }, {
      "title": "The Fantastic Four: First Steps",
      "summary":
      "Forced to balance their roles as heroes with the strength of their family bond, the Fantastic Four must defend Earth from a ravenous space god called Galactus and his enigmatic Herald, Silver Surfer.",
      "image_url":
      "https://upload.wikimedia.org/wikipedia/en/thumb/1/13/The_Fantastic_Four_First_Steps_poster.jpg/250px-The_Fantastic_Four_First_Steps_poster.jpg"
    }, {
      "title": "Jurassic Park",
      "summary":
      "An industrialist invites some experts to visit his theme park of cloned dinosaurs. After a power failure, the creatures run loose, putting everyone's lives, including his grandchildren's, in danger.",
      "image_url":
      "https://m.media-amazon.com/images/M/MV5BMjM2MDgxMDg0Nl5BMl5BanBnXkFtZTgwNTM2OTM5NDE@._V1_.jpg"
    }, {
      "title": "Spider-Man",
      "summary":
      "After being bitten by a genetically-modified spider, a shy teenager gains spider-like abilities that he uses to fight injustice as a masked superhero and face a vengeful enemy.",
      "image_url":
      "https://m.media-amazon.com/images/M/MV5BZWM0OWVmNTEtNWVkOS00MzgyLTkyMzgtMmE2ZTZiNjY4MmFiXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg"
    }, {
      "title": "Logan",
      "summary":
      "In a future where mutants are nearly extinct, an elderly and weary Logan leads a quiet life. But when Laura, a mutant child pursued by scientists, comes to him for help, he must get her to safety.",
      "image_url":
      "https://upload.wikimedia.org/wikipedia/en/3/37/Logan_2017_poster.jpg"
    },
    {
      "title": "Avengers: Endgame",
      "summary":
      "After the devastating events of Avengers: Infinity War, the Avengers assemble once more in order to reverse Thanos' actions and restore balance to the universe.",
      "image_url":
      "https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_FMjpg_UX1000_.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // 5 tabs
      child: Scaffold(
        appBar: AppBar(
          title:  Text("DarkMovies",style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelStyle: TextStyle(
                fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: "Home"),
              Tab(text: "Movies"),
              Tab(text: "Anime"),
              Tab(text: "Series"),
              Tab(text: "Manhwa"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildMovieGrid(context),
            buildMovieGrid(context),
            const Center(child: Text("Anime Tab")),
            const Center(child: Text("Series Tab")),
            const Center(child: Text("Manhwa Tab")),
          ],
        ),
      ),
    );
  }

  /// Movie Grid without summary
  Widget buildMovieGrid(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        mainAxisSpacing: 9,
        crossAxisSpacing: 9,
        childAspectRatio: 0.7,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        var movie = movies[index];
        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MovieDetail(
                          movieTitle: movie['title'],
                          movieSummary: movie['summary'],
                        ),
                      ),
                    );
                  },
                  child: CachedNetworkImage(
                    imageUrl: movie['image_url'],
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  movie['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height:5),
            ],
          ),
        );
      },
    );
  }
}

