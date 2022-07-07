import 'package:clean_api/clean_api.dart';
import 'package:demo_provider/models/i_movie_repo.dart';

import '../models/movie.dart';
import '../models/movie_detail.dart';
import '../models/movie_watch.dart';

class MovieRepo extends IMovieRepo {
  final api = CleanApi.instance();
  final List<MovieWatch> watchedMovies = [];

  @override
  Future<List<MovieWatch>> getAllWatchMovie() async {
    return watchedMovies;
  }

  @override
  Future<List<Movie>> getMoviesByGenre({required String genre}) async {
    // await Future.delayed(const Duration(seconds: 2));
    final data = await api.get(
        fromJson: (json) {
          final List movies = json['results'];
          final parsedMovies =
              List<Movie>.from(movies.map((e) => Movie.fromMap(e)));

          return parsedMovies;
        },
        endPoint:
            "discover/movie?api_key=fc755f79a31de06cbf4002bed249f80c&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_genres=$genre");

    return data.fold((l) => [], (r) => r);
  }

  @override
  Future<Either<CleanFailure, MovieDetail>> getMoviesById(
      {required int movieId}) async {
    final data = await api.get(
        fromJson: (json) {
          final MovieDetail movie = MovieDetail.fromMap(json);
          // final parsedMovies =<MovieDetail>.from

          return movie;
        },
        endPoint:
            "movie/$movieId?api_key=fc755f79a31de06cbf4002bed249f80c&language=en-US");

    return data;
  }

  @override
  Future<MovieDetail?> suggestMovie({required int mood}) async {
    final List<Movie> movies = [];
    if (mood == 1) {
      final actions = await getMoviesByGenre(genre: 'action');
      final drama = await getMoviesByGenre(genre: 'dama');
      final mistery = await getMoviesByGenre(genre: 'mistery');
      final thriller = await getMoviesByGenre(genre: 'thriller');
      movies.addAll(actions);
      movies.addAll(drama);
      movies.addAll(mistery);
      movies.addAll(thriller);
      movies.shuffle();
    } else if (mood == 2) {
      final comedy = await getMoviesByGenre(genre: 'comedy');
      final musical = await getMoviesByGenre(genre: 'musical');
      final biography = await getMoviesByGenre(genre: 'biography');
      movies.addAll(comedy);
      movies.addAll(musical);
      movies.addAll(biography);
      movies.shuffle();
    } else if (mood == 3) {
      final romance = await getMoviesByGenre(genre: 'romance');
      final fantasy = await getMoviesByGenre(genre: 'fantasy');
      final horror = await getMoviesByGenre(genre: 'horror');
      movies.addAll(romance);
      movies.addAll(fantasy);
      movies.addAll(horror);
      movies.shuffle();
    }
    int movieId = movies.first.movieId;
    print("_______________movieID: $movieId");

    Either<CleanFailure, MovieDetail> movie =
        await getMoviesById(movieId: movieId);

    return movie.fold((l) => null, (r) => r);
  }
}
