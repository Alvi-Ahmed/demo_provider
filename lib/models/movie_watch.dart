import 'dart:convert';

import 'package:equatable/equatable.dart';

class MovieWatch extends Equatable {
  final int movieId;
  final String overview;
  final String image;
  final String title;
  final double rating;
  MovieWatch({
    required this.movieId,
    required this.overview,
    required this.image,
    required this.title,
    required this.rating,
  });

  MovieWatch copyWith({
    int? movieId,
    String? overview,
    String? image,
    String? title,
    double? rating,
  }) {
    return MovieWatch(
      movieId: movieId ?? this.movieId,
      overview: overview ?? this.overview,
      image: image ?? this.image,
      title: title ?? this.title,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'movie_id': movieId,
      'overview': overview,
      'image': image,
      'title': title,
      'rating': rating,
    };
  }

  factory MovieWatch.fromMap(Map<String, dynamic> map) {
    return MovieWatch(
      movieId: map['movie_id']?.toInt() ?? 0,
      overview: map['overview'] ?? '',
      image: map['image'] ?? '',
      title: map['title'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieWatch.fromJson(String source) =>
      MovieWatch.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovieWatch(movieId: $movieId, overview: $overview, image: $image, title: $title, rating: $rating)';
  }

  @override
  List<Object> get props {
    return [
      movieId,
      overview,
      image,
      title,
      rating,
    ];
  }
}
