class Movie {
  final String poster, title, genre, synopsis;
  final double rating;
  final int duration;

  Movie(
      {required this.poster,
      required this.title,
      required this.genre,
      required this.synopsis,
      required this.rating,
      required this.duration});
}

List<Movie> movies = [
  Movie(
      poster: 'images/midnight_texas.jpg',
      title: 'Midnight-Texas',
      genre: 'action',
      synopsis: synopsis,
      rating: 9.0,
      duration: 120),
  Movie(
      poster: 'images/blackphone.jpg',
      title: 'Midnight-Texas',
      genre: 'Comedy',
      synopsis: synopsis,
      rating: 8.3,
      duration: 110),
  Movie(
      poster: 'images/trailer.jpg',
      title: 'Midnight-Texas',
      genre: 'Horror',
      synopsis: synopsis,
      rating: 8.0,
      duration: 130),
  Movie(
      poster: 'images/veronica_mars.jpg',
      title: 'Midnight-Texas',
      genre: 'Drama',
      synopsis: synopsis,
      rating: 8.9,
      duration: 140),
  Movie(
      poster: 'images/superman.jpg',
      title: 'Midnight-Texas.jpg',
      genre: 'Criminal',
      synopsis: synopsis,
      rating: 7.5,
      duration: 120),
  Movie(
      poster: 'images/hitman agent47.jpg',
      title: 'Midnight-Texas',
      genre: 'Criminal',
      synopsis: synopsis,
      rating: 7.5,
      duration: 120),
  Movie(
      poster: 'images/zen.jpg',
      title: 'Midnight-Texas',
      genre: 'Criminal',
      synopsis: synopsis,
      rating: 7.5,
      duration: 120),
];

const String synopsis =
    "Synosis: In the year 2147, humanity lives only in  a dystopian society where time is only ";
