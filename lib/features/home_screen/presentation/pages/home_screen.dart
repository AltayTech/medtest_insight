import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        /// Add bottom to navigate to scan screen
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Scan Test result'),
        ),
      ),
    );
  }
}
