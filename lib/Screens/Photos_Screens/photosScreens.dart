import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class photosPage extends StatefulWidget {
  const photosPage({super.key});

  @override
  State<photosPage> createState() => _photosPageState();
}

class _photosPageState extends State<photosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('PRUEBA PHOTOS')),
    );
  }
}
