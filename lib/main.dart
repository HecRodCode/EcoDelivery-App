import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: EcoDeliveryApp()));
}

class EcoDeliveryApp extends StatelessWidget {
  const EcoDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoDelivery',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
      home: const Scaffold(
        body: Center(child: Text('EcoDelivery App')),
      ),
    );
  }
}
