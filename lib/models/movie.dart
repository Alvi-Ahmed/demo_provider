import 'dart:convert';

import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int movieId;
  final String overview;
  final String image;
  final String releaseDate;
  final String title;
  final double rating;
  const Movie({
    required this.movieId,
    required this.overview,
    required this.image,
    required this.releaseDate,
    required this.title,
    required this.rating,
  });

  Movie copyWith({
    int? movieId,
    String? overview,
    String? image,
    String? releaseDate,
    String? title,
    double? rating,
  }) {
    return Movie(
      movieId: movieId ?? this.movieId,
      overview: overview ?? this.overview,
      image: image ?? this.image,
      releaseDate: releaseDate ?? this.releaseDate,
      title: title ?? this.title,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'movieId': movieId,
      'overview': overview,
      'poster_path': image,
      'release_date': releaseDate,
      'title': title,
      'vote_average': rating,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      movieId: map['id'] ?? '',
      overview: map['overview'] ?? '',
      image: map['poster_path'] ?? '',
      releaseDate: map['release_date'] ?? '',
      title: map['title'] ?? '',
      rating: double.parse((map['vote_average'] ?? 0).toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Movie(movieId: $movieId, overview: $overview, image: $image, releaseDate: $releaseDate, title: $title, rating: $rating)';
  }

  @override
  List<Object> get props {
    return [
      movieId,
      overview,
      image,
      releaseDate,
      title,
      rating,
    ];
  }
}
