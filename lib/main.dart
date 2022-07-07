import 'package:clean_api/clean_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/movie_provider.dart';

import 'screens/home_screen.dart';

void main() {
  CleanApi.instance().setup(baseUrl: 'https://api.themoviedb.org/3/');
  runApp(ChangeNotifierProvider<MovieProvider>(
    child: const MyApp(),
    create: (_) => MovieProvider(), // Create a new ChangeNotifier object
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Movie List',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomeScreen(),
    );
  }
}
