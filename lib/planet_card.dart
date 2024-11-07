import 'package:flutter/material.dart';
import '../planet.dart';

class PlanetCard extends StatelessWidget {
  final Planet planet;
  final VoidCallback onTap;

  PlanetCard({required this.planet, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(child: Image.asset(planet.image, fit: BoxFit.cover)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                planet.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
