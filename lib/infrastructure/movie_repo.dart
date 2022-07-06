import 'package:clean_api/clean_api.dart';
import 'package:demo_provider/models/i_movie_repo.dart';

import '../models/movie_watch.dart';

class MovieRepo extends IMovieRepo {
  final api = CleanApi.instance();
  final List<MovieWatch> watchedMovies = [];

  @override
  Future<List<MovieWatch>> getAllWatchMovie() async {
    return watchedMovies;
  }
}
