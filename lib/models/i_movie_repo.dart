import 'package:clean_api/clean_api.dart';
import 'package:demo_provider/models/movie_watch.dart';

abstract class IMovieRepo {
  Future<List<MovieWatch>> getAllWatchMovie();
}
