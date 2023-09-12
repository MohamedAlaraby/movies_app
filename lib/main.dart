import 'package:flutter/material.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';

import 'movies/presentation/screens/movies_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MovieRemoteDataSource.init();
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies Screen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MoviesScreen(),
    );
  }
}