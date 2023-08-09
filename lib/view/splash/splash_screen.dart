import 'package:flutter/material.dart';

class SplasScreen extends StatefulWidget {
  const SplasScreen({super.key});

  @override
  State<SplasScreen> createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}