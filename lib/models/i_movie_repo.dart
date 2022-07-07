import 'package:clean_api/clean_api.dart';
import 'package:demo_provider/models/movie_detail.dart';
import 'package:demo_provider/models/movie_watch.dart';

import 'movie.dart';

abstract class IMovieRepo {
  Future<List<MovieWatch>> getAllWatchMovie();
  Future<List<Movie>> getMoviesByGenre({required String genre});
  Future<MovieDetail?> suggestMovie({required int mood});
  Future<Either<CleanFailure, MovieDetail>> getMoviesById(
      {required int movieId});
}
