// lib/screens/tickets_page.dart
import 'package:flutter/material.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  String? selectedMatch;
  String? selectedCategory;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Billetterie'),
        backgroundColor:Colors.green ,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Prochains matches
          const Text(
            'Prochains matches',
            style: TextStyle(
              fontSize: 20,
               color: Colors.green,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              
              title: const Text('Jaraff vs Diambars'),
              subtitle: const Text('15 Nov 2024 - 20:00'),
              trailing: ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedMatch = 'Match 1';
                  });
                },
                child: const Text('Acheter',
                style: TextStyle(color: Colors.green),),
              ),
            ),
          ),
          
          if (selectedMatch != null) ...[
            const SizedBox(height: 24),
            const Text(
              'Sélectionnez votre catégorie',
              style: TextStyle(
                fontSize: 20,
                  color: Colors.green,
              ),
            ),
            const SizedBox(height: 16),
            // Catégories de billets
            ...['Tribune Présidentielle', 'Tribune Latérale', 'Virage'].map(
              (category) => Card(
                child: ListTile(
                  title: Text(category),
                  subtitle: Text('À partir de ${category == 'Virage' ? '30' : category == 'Tribune Latérale' ? '50' : '80'}€'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    child: const Text('Choisir',
                    style: TextStyle(color: Colors.green),),
                  ),
                ),
              ),
            ),
          ],

          if (selectedCategory != null) ...[
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Quantité',
                      style: TextStyle(
                        fontSize: 18,
                         color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButton<int>(
                      value: quantity,
                      isExpanded: true,
                      items: List.generate(
                        5,
                        (index) => DropdownMenuItem(
                          value: index + 1,
                          child: Text('${index + 1} billet${index > 0 ? 's' : ''}'),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          quantity = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Récapitulatif',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text('Match sélectionné: $selectedMatch'),
                    Text('Catégorie: $selectedCategory'),
                    Text('Quantité: $quantity'),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () {
                          // Logique de paiement
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Redirection vers le paiement...'),
                            ),
                          );
                        },
                        child: const Text(
                          'Payer maintenant',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}