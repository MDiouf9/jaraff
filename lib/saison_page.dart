import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final matches = [
      {
        'homeTeam': 'Jaraff',
        'awayTeam': 'linguer',
        'date': '15 Nov 2024',
        'time': '20:00',
        'competition': 'Championnat',
        'isHome': true,
      },
      {
        'homeTeam': 'Jaraff',
        'awayTeam': 'linguer',
        'date': '15 Nov 2024',
        'time': '20:00',
        'competition': 'Championnat',
        'isHome': true,
      },
      {
        'homeTeam': 'DSC',
        'awayTeam': 'Jaraff',
        'date': '22 Nov 2024',
        'time': '20:45',
        'competition': 'Coupe',
        'isHome': false,
      },
        {
        'homeTeam': 'DSC',
        'awayTeam': 'Jaraff',
        'date': '22 Nov 2024',
        'time': '20:45',
        'competition': 'Coupe',
        'isHome': false,
      },
      // Ajoutez plus de matches ici
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendrier'),
        backgroundColor:Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: matches.length,
        itemBuilder: (context, index) {
          final match = matches[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          match['homeTeam'] as String,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'VS',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          match['awayTeam'] as String,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${match['date'] as String} - ${match['time'] as String}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      match['competition'] as String,
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
