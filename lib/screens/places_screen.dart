import 'package:fav_places/screens/new_place.dart';
import 'package:flutter/material.dart';

class PlacessScreen extends StatefulWidget {
  const PlacessScreen({super.key});

  @override
  State<PlacessScreen> createState() {
    return _PlacessScreen();
  }
}

class _PlacessScreen extends State<PlacessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Places'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => NewPlace()));
              })
        ],
      ),
      body: (ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) => const Text('Taj mahal'),
      )),
    );
  }
}
