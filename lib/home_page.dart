import 'package:flutter/material.dart';
import 'package:jaraaf/publication_page.dart';
import 'package:jaraaf/saison_page.dart';
import 'package:jaraaf/shop_page.dart';
import 'package:jaraaf/tiket_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _navigateToPublication(String title, String content, String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PublicationPage(
          title: title,
          content: content,
          imagePath: imagePath,
        ),
      ),
    );
  }

  void _navigatBottom(int index) {
    switch (index) {
      case 0:
        break; // Ajouter votre logique pour la première page ici
      case 1:
        Navigator.push(
          context,
       MaterialPageRoute(builder: (context) => const TicketsPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CalendarPage()), 
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ShopPage()), 
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TicketsPage()), 
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image.asset(
                  'assets/images/blason.jpg',
                  height: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: const Color.fromARGB(255, 6, 166, 94),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 40,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff008000),
                    Color.fromARGB(255, 207, 186, 2),
                    Color.fromARGB(255, 224, 67, 55),
                  ],
                  stops: [0.2, 0.5, 1],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: const Text(
                      "connexion",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: const Text(
                      "inscription",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_right,
                    size: 35,
                    color: Color.fromARGB(255, 245, 245, 244),
                  ),
                ],
              ),
            ),
            const TabBar(
              indicatorColor: Colors.green,
              labelColor: Color.fromARGB(255, 76, 175, 80),
              unselectedLabelColor: Color.fromARGB(255, 210, 38, 8),
              tabs: [
                Tab(text: 'Actualités'),
                Tab(text: 'Devenir Membre'),
                Tab(text: 'Matches'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        final titles = [
                          'Titre de l actualité 1',
                          'Titre de l actualité 2',
                          'Titre de l actualité 3',
                        ];
                        final contents = [
                          'Contenu de la publication 1. Ceci est un aperçu...',
                          'Contenu de la publication 2. Ceci est un aperçu...',
                          'Contenu de la publication 3. Ceci est un aperçu...',
                        ];
                        return GestureDetector(
                          onTap: () => _navigateToPublication(
                            titles[index],
                            contents[index],
                            'assets/images/maillot jaraff.jpg',
                          ),
                          child: _buildNewsCard(
                            titles[index],
                            contents[index],
                            'assets/images/maillot jaraff.jpg',
                          ),
                        );
                      },
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/images/maillot jaraff.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: 'JARAFF ',
                                  style: TextStyle(color: Colors.green),
                                ),
                                TextSpan(
                                  text: 'DE LA MEDINA',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Center(child: Text("Contenu de l'onglet Matches")),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.money),
              label: 'Billetterie',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer),
              label: 'Saison',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: 'Boutique',
            ),
          ],
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          currentIndex: 0, // Changez cela pour mettre en surbrillance un élément différent
          onTap: _navigatBottom,
        ),
      ),
    );
  }

  Widget _buildNewsCard(String title, String text, String imagePath) {
    return Container(
      height: 160,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Stack(
        children: [
          Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.2),
                    offset: const Offset(-5.0, 5.0),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.asset(
                    imagePath,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        text,
                        style: const TextStyle(fontSize: 14),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
