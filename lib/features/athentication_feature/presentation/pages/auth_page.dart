import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medtest_insight/features/home_screen/presentation/pages/home_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  static const routeName = '/autPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return HomeScreen();
          }
        },
      ),
    );
  }
}
