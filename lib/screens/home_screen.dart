import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final List<Widget> _items = [
    ListTile(
      leading: Icon(Icons.calendar_today, color: Colors.deepPurple),
      title: Text('Prik een vaste dag om af te spreken met een algemene groep.'),
    ),
    ListTile(
      leading: Icon(Icons.group, color: Colors.deepPurple),
      title: Text('Doe mee met activiteiten zoals bowlen, schaatsen, drinken, paintball en meer.'),
    ),
    ListTile(
      leading: Icon(Icons.group_add, color: Colors.deepPurple),
      title: Text('Richt je eigen groepjes op binnen bepaalde thema\'s of vriendengroepen.'),
    ),
    ListTile(
      leading: Icon(Icons.attach_money, color: Colors.deepPurple),
      title: Text('Houd bij wie hoeveel moet betalen als er is voorgeschoten voor drinken of activiteiten.'),
    ),
    ListTile(
      leading: Icon(Icons.person_add, color: Colors.deepPurple),
      title: Text('Leer nieuwe mensen kennen en ga om de 2 jaar op reis naar het buitenland.'),
    ),
  ];

  final Random _random = Random();
  late List<Widget> _visibleItems;
  late Timer _timer;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _visibleItems = _getRandomItems();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      setState(() {
        _visibleItems = _getRandomItems();
        _animationController.forward(from: 0.0);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _animationController.dispose();
    super.dispose();
  }

  List<Widget> _getRandomItems() {
    List<Widget> newItems = [];
    Set<int> usedIndices = Set<int>();

    while (newItems.length < 3) {
      int index = _random.nextInt(_items.length);
      if (!usedIndices.contains(index)) {
        usedIndices.add(index);
        newItems.add(_items[index]);
      }
    }

    return newItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.cyan],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 50),
                const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Welkom bij Friendship HQ!',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Met Friendship HQ kun je gemakkelijk afspreken met vrienden, nieuwe mensen ontmoeten en leuke activiteiten plannen. Hier zijn enkele dingen die je met onze app kunt\u00A0doen:',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                FadeTransition(
                  opacity: _animation,
                  child: Card(
                    color: Colors.white.withOpacity(0.8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: _visibleItems,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () {
                    // Navigeer naar inloggen scherm
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Aanmelden',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () {
                    // Navigeer naar registreren scherm
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Registreren',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
