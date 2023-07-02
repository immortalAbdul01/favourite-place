import 'package:fav_places/models/places.dart';
import 'package:fav_places/providers/places_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewPlace extends ConsumerStatefulWidget {
  NewPlace({super.key});

  @override
  ConsumerState<NewPlace> createState() => _NewPlaceState();
}

class _NewPlaceState extends ConsumerState<NewPlace> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var _title = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13),
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
              Container(
                  width: 155,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        ref
                            .read(placesProvider.notifier)
                            .addItem(Places(name: _title));
                      });
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add a place'),
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
