import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/review.dart';

class ReviewService {
  final String apiUrl = "https://api.themoviedb.org/3/movie"; 
  final String apiKey = "1ef9420b1d1988fd82dee5eaf93285bd"; 

  // Fetch reviews for a specific movie by movieId
  Future<List<Review>> fetchReviews(String movieId) async {
    try {
      final response =
          await http.get(Uri.parse('$apiUrl/$movieId/reviews?api_key=$apiKey'));

      if (response.statusCode == 200) {
        final List<dynamic> reviewJson = json.decode(response.body)['results'];
        return reviewJson.map((json) => Review.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load reviews: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching reviews: $e');
      return [];
    }
  }
}

// Main function to test fetching reviews for a movie
void main() async {
  ReviewService reviewService = ReviewService();

  print('Fetching reviews for movie ID: 550 (Fight Club)...');

  try {
    final reviews =
        await reviewService.fetchReviews('550'); // Movie ID 550 for Fight Club

    if (reviews.isNotEmpty) {
      print('Reviews fetched successfully:');
      for (var review in reviews) {
        print('Author: ${review.author}');
        print('Content: ${review.content}');
        if (review.url != null) {
          print('URL: ${review.url}');
        }
        print('---');
      }
    } else {
      print('No reviews found.');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}
