import 'package:flutter/material.dart';

class NewPlace extends StatelessWidget {
  NewPlace({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a item'),
      ),
      body: (Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration:
                  const InputDecoration(label: Text('Enter the name of place')),
            ),
            ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: const [Icon(Icons.add), Text('add a new place')],
                ))
          ],
        ),
      )),
    );
  }
}
