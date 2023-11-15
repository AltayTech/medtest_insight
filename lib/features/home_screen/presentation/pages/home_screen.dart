import 'package:flutter/material.dart';
import 'package:medtest_insight/features/scan/presentation/pages/scan_screen.dart';

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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue[50],
                  // border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text('Welcome to Medical test analyzer',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24)),
                      Text(
                        'Upload image of medical test result and we analyze it for you',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ScanScreen.routeName);
              },
              child: const Text('Start Analyse'),
            ),
          ],
        ),
      ),
    );
  }
}
