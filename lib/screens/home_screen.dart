// screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/movie_provider.dart';
import 'my_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<MovieProvider>().loadMovieByMoods(1);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movieDetails;
    var myList = context.watch<MovieProvider>().myList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MyListScreen(),
                ),
              );
            },
            icon: const Icon(Icons.favorite),
            label: Text(
              "Go to my list (${myList.length})",
              style: const TextStyle(fontSize: 24),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 20)),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
              child: Card(
            key: ValueKey(movies?.title),
            color: Colors.amberAccent.shade100,
            elevation: 4,
            child: ListTile(
              title: Text(movies?.originalTitle != null
                  ? movies!.originalTitle
                  : "NO MOVIE"),
              trailing: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: myList.contains(movies) ? Colors.red : Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  // if (!myList.contains(movies)) {
                  //   context.read<MovieProvider>().addToList(movies);
                  // } else {
                  //   context.read<MovieProvider>().removeFromList(currentMovie);
                  // }
                },
              ),
            ),
          ))
        ]),
      ),
    );
  }
}
