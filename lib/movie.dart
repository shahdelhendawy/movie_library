class Movie {
  final String title;
  final String genre;
  final int year;
  final double rating;
  final String image;
  final String description;

  const Movie({
    required this.title,
    required this.genre,
    required this.year,
    required this.rating,
    required this.image,
    required this.description,
  });
}

final List<Movie> movies = [
  const Movie(
    title: 'The Amazing World of Gumball',
    genre: 'Comedy / Animation',
    year: 2011,
    rating: 8.3,
    image: 'assets/posters/gumball.png',
    description: 'Gumball and Darwin turn everyday situations into hilarious adventures.',
  ),
  const Movie(
    title: 'We Bare Bears',
    genre: 'Comedy / Animation',
    year: 2015,
    rating: 7.9,
    image: 'assets/posters/we_bare_bears.png',
    description: 'Three bear brothers try to fit into the human world.',
  ),
  const Movie(
    title: 'The Powerpuff Girls',
    genre: 'Action / Comedy',
    year: 1998,
    rating: 7.3,
    image: 'assets/posters/powerpuff_girls.png',
    description: 'Three superpowered girls protect Townsville from villains.',
  ),
  const Movie(
    title: 'Teen Titans Go!',
    genre: 'Action / Comedy',
    year: 2013,
    rating: 5.5,
    image: 'assets/posters/teen_titans_go.png',
    description: 'Young superheroes balance daily life with silly adventures.',
  ),
  const Movie(
    title: 'Scooby-Doo',
    genre: 'Mystery / Comedy',
    year: 1969,
    rating: 7.9,
    image: 'assets/posters/scooby_doo.png',
    description:
        'Scooby-Doo and his friends solve mysteries and unmask villains.',
  ),
  const Movie(
    title: 'Clarence',
    genre: 'Comedy / Animation',
    year: 2014,
    rating: 6.7,
    image: 'assets/posters/clarence.png',
    description:
        'Clarence finds fun and adventure in everyday life with his friends.',
  ),
  const Movie(
    title: 'Ben 10',
    genre: 'Action / Sci-Fi',
    year: 2005,
    rating: 7.5,
    image: 'assets/posters/ben_10.png',
    description:
        'Ben uses an alien watch to transform and fight dangerous threats.',
  ),
  const Movie(
    title: 'Uncle Grandpa',
    genre: 'Comedy / Fantasy',
    year: 2013,
    rating: 5.6,
    image: 'assets/posters/uncle_grandpa.png',
    description: 'A magical uncle helps kids through bizarre adventures.',
  ),
  const Movie(
    title: 'Regular Show',
    genre: 'Comedy / Fantasy',
    year: 2010,
    rating: 8.5,
    image: 'assets/posters/regular_show.png',
    description:
        'Two park workers turn simple tasks into unbelievable adventures.',
  ),
  const Movie(
    title: 'Adventure Time',
    genre: 'Adventure / Fantasy',
    year: 2010,
    rating: 8.6,
    image: 'assets/posters/adventure_time.png',
    description:
        'Finn and Jake explore the Land of Ooo and face strange challenges.',
  ),
  const Movie(
    title: 'Angelo Rules',
    genre: 'Comedy / Animation',
    year: 2010,
    rating: 6.5,
    image: 'assets/posters/angelo_rules.png',
    description: 'Angelo uses clever plans to solve everyday problems.',
  ),
  const Movie(
    title: 'Tom and Jerry',
    genre: 'Comedy / Animation',
    year: 1940,
    rating: 8.1,
    image: 'assets/posters/tom_and_jerry.png',
    description:
        'Tom and Jerry entertain with endless comic chases and tricks.',
  ),
];
