import 'package:flutter/material.dart';
import '../planet.dart';

class PlanetDetailScreen extends StatelessWidget {
  final Planet planet;

  PlanetDetailScreen({required this.planet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(planet.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(planet.image),
            SizedBox(height: 10),
            Text(planet.description, style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('حقائق ممتعة:', style: TextStyle(fontSize: 20)),
            for (var fact in planet.funFacts) Text(fact),
          ],
        ),
      ),
    );
  }
}
