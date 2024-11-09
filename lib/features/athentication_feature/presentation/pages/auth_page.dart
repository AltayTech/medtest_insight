import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meditest/core/widgets/main_wrapper.dart';
import 'package:meditest/features/athentication_feature/presentation/widgets/loginOrRegister.dart';

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
            return MainWrapper();
          } else {
            return LoginOrRegister();
          }
        },
      ),
    );
  }
}
