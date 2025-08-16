import 'package:flutter/material.dart';
import 'recommendation_service.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MovieDetail extends StatefulWidget {
  final String movieTitle;
  final String movieSummary;

  const MovieDetail({
    required this.movieTitle,
    required this.movieSummary,
    super.key,
  });

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  late Future<List<dynamic>> _recommendations;

  @override
  void initState() {
    super.initState();
    _recommendations = getRecommendations(widget.movieTitle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.movieTitle)),
      body: FutureBuilder<List<dynamic>>(
        future: _recommendations,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error loading recommendations"));
          }

          final movies = snapshot.data ?? [];

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Movie summary (Main movie only)
                  Text(
                    widget.movieSummary,
                    style: const TextStyle(fontSize: 20, height: 5),
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    "Recommended Movies",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),

                  if (movies.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("No recommendations found"),
                    )
                  else
                    GridView.builder(
                      shrinkWrap: true, // important for nested scroll
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 6,
                        mainAxisSpacing: 9,
                        crossAxisSpacing: 9,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        var movie = movies[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => MovieDetail(
                                  movieTitle: movie['title'] ?? '',
                                  movieSummary: movie['summary'] ?? '',
                                ),
                              ),
                            );
                          },
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: CachedNetworkImage(
                                    imageUrl: movie['image_url'] ?? '',
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                    const Center(child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    movie['title'] ?? '',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                // ❌ Removed summary display here
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
