import 'package:fav_places/models/places.dart';
import 'package:fav_places/providers/places_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dart:io';

// custom imports

import 'package:fav_places/widgets/image_input.dart';

class NewPlace extends ConsumerStatefulWidget {
  NewPlace({super.key});

  @override
  ConsumerState<NewPlace> createState() => _NewPlaceState();
}

class _NewPlaceState extends ConsumerState<NewPlace> {
  File? _selectedImage;

  void _addNewPlace(String _title) {
    if (_title.isEmpty || _selectedImage == null) {
      return;
    }
    setState(() {
      ref.read(placesProvider.notifier).addPlace(_title, _selectedImage!);
    });
    Navigator.of(context).pop();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var _title;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a item'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: (Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  _title = value;
                },
                decoration: const InputDecoration(
                    label: Text('Enter the name of place')),
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 12,
              ),
              ImageInput(
                onPick: (image) {
                  _selectedImage = image;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: 155,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _addNewPlace(_title);
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add a place'),
                  )),
            ],
          ),
        )),
      ),
    );
  }
}
