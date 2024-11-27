import 'package:flutter/material.dart';

class PublicationPage extends StatelessWidget {
  final String title;
  final String content;
  final String imagePath;

  const PublicationPage({
    super.key,
    required this.title,
    required this.content,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align( 
           alignment: Alignment.center, // Centrer l'image horizontalement
          child: Image.asset(imagePath),
            ), // Affiche l'image en haut
            const SizedBox(height: 16),
            Text(
              content,
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
