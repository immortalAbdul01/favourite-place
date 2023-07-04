import 'package:uuid/uuid.dart';
import 'dart:io';

const uuid = Uuid();

class Places {
  Places({required this.name, required this.image}) : id = uuid.v4();
  final String name;
  final String id;
  final File image;
}
