// provider/movie_provider.dart
import 'package:demo_provider/models/i_movie_repo.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import '../infrastructure/movie_repo.dart';
import '../models/movie_detail.dart';
import '../models/movies.dart';

// A list of movies
final List<Movie> initialData = List.generate(
    50,
    (index) => Movie(
        title: "Moview $index",
        runtime: "${Random().nextInt(100) + 60} minutes"));

class MovieProvider with ChangeNotifier {
  final IMovieRepo movieRepo = MovieRepo();

  // All movies (that will be displayed on the Home screen)
  final List<Movie> _movies = initialData;

  // Retrieve all movies
  List<Movie> get movies => _movies;

  // Favorite movies (that will be shown on the MyList screen)
  final List<Movie> _myList = [];
  // List<MovieDetail> get movieList => _movieList;
  // Retrieve favorite movies
  List<Movie> get myList => _myList;
  MovieDetail? movieDetails = MovieDetail(
      adult: false,
      budget: 0,
      genres: [],
      originalLanguage: "",
      voteCount: 0,
      voteAverage: 0,
      id: 0,
      spokenLanguages: [],
      originalTitle: "",
      imdbId: "",
      overview: "",
      status: "",
      posterPath: "",
      title: "");

  // Adding a movie to the favorites list
  void addToList(Movie movie) {
    _myList.add(movie);
    notifyListeners();
  }

  void loadMovieByMoods(int mood) async {
    movieDetails = await movieRepo.suggestMovie(mood: 1);
    notifyListeners();
  }

  // Removing a movie from the favorites list
  void removeFromList(Movie movie) {
    _myList.remove(movie);
    notifyListeners();
  }
}
