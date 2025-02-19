// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/movie_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MovieService _movieService = MovieService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movies")),
      body: Center(child: Text("Movie list displayed here")),
    );
  }
}
