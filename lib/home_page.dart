import 'package:flutter/material.dart';

import 'movie.dart';
import 'movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = '';
  bool isGrid = true;

  final Set<String> favorites = {};
  final Set<String> bookmarks = {};
  final Map<String, int> fansCount = {};

  @override
  Widget build(BuildContext context) {
    final filteredMovies = movies.where((movie) {
      final query = searchQuery.trim().toLowerCase();

      return movie.title.toLowerCase().contains(query) ||
          movie.genre.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/brand/cartoon_network_logo.png',
              height: 36,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.movie, size: 30);
              },
            ),
            const SizedBox(width: 10),
            const Flexible(
              child: Text(
                'Cartoon Network',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: isGrid ? 'List view' : 'Grid view',
            icon: Icon(isGrid ? Icons.view_list : Icons.grid_view_rounded),
            onPressed: () {
              setState(() {
                isGrid = !isGrid;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search your favorite cartoons...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xFFD5EAF5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Color(0xFF00AEEF),
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: filteredMovies.isEmpty
                ? const Center(
                    child: Text(
                      'No cartoons found',
                      style: TextStyle(
                        color: Color(0xFF64748B),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                : LayoutBuilder(
                    builder: (context, constraints) {
                      final width = constraints.maxWidth;

                      final columns = width >= 1100
                          ? 4
                          : width >= 750
                          ? 3
                          : 2;

                      if (isGrid) {
                        return GridView.builder(
                          padding: const EdgeInsets.all(10),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: columns,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: columns == 4
                                    ? 0.82
                                    : columns == 3
                                    ? 0.72
                                    : 0.62,
                              ),
                          itemCount: filteredMovies.length,
                          itemBuilder: (context, index) {
                            final movie = filteredMovies[index];

                            return MovieCard(
                              movie: movie,
                              isList: false,
                              fans: fansCount[movie.title] ?? 120,
                              isFavorite: favorites.contains(movie.title),
                              isBookmarked: bookmarks.contains(movie.title),
                              onFavoriteTap: () {
                                setState(() {
                                  if (!favorites.add(movie.title)) {
                                    favorites.remove(movie.title);
                                  }
                                });
                              },
                              onBookmarkTap: () {
                                setState(() {
                                  if (!bookmarks.add(movie.title)) {
                                    bookmarks.remove(movie.title);
                                  }
                                });
                              },
                              onFansTap: () {
                                setState(() {
                                  fansCount[movie.title] =
                                      (fansCount[movie.title] ?? 120) + 1;
                                });
                              },
                            );
                          },
                        );
                      }

                      return ListView.separated(
                        padding: const EdgeInsets.all(12),
                        itemCount: filteredMovies.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 12);
                        },
                        itemBuilder: (context, index) {
                          final movie = filteredMovies[index];

                          return SizedBox(
                            height: 220,
                            width: double.infinity,
                            child: MovieCard(
                              movie: movie,
                              isList: true,
                              fans: fansCount[movie.title] ?? 120,
                              isFavorite: favorites.contains(movie.title),
                              isBookmarked: bookmarks.contains(movie.title),
                              onFavoriteTap: () {
                                setState(() {
                                  if (!favorites.add(movie.title)) {
                                    favorites.remove(movie.title);
                                  }
                                });
                              },
                              onBookmarkTap: () {
                                setState(() {
                                  if (!bookmarks.add(movie.title)) {
                                    bookmarks.remove(movie.title);
                                  }
                                });
                              },
                              onFansTap: () {
                                setState(() {
                                  fansCount[movie.title] =
                                      (fansCount[movie.title] ?? 120) + 1;
                                });
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
