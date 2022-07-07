import 'dart:convert';

import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String title;
  final String runtime; // how long this movie is (in minute)

  Movie({
    required this.title,
    required this.runtime,
  });

  Movie copyWith({
    String? title,
    String? runtime,
  }) {
    return Movie(
      title: title ?? this.title,
      runtime: runtime ?? this.runtime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'runtime': runtime,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'] ?? '',
      runtime: map['runtime'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));

  @override
  String toString() => 'Movie(title: $title, runtime: $runtime)';

  @override
  List<Object> get props => [title, runtime];
}
