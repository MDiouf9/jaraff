import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models.dart';
final matchesProvider = Provider<List<Match>>((ref) => [
  Match(name: 'Match A', location: 'Stade 1', date: DateTime.now()),
  Match(name: 'Match B', location: 'Stade 2', date: DateTime.now().add(Duration(days: 1))),
]);

final productsProvider = Provider<List<Product>>((ref) => [
  Product(name: 'T-shirt', price: 20.0, imageUrl: 'https://via.placeholder.com/150'),
  Product(name: 'Ballon', price: 15.0, imageUrl: 'https://via.placeholder.com/150'),
]);
