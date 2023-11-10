import 'package:flutter/material.dart';
import 'package:medtest_insight/core/widgets/main_wrapper.dart';
import 'package:provider/provider.dart';

import 'features/home_screen/presentation/pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MaterialApp(
        title: 'MedTest Insight',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MainWrapper(),
         routes: {
      HomeScreen.routeName: (ctx) => HomeScreen(),
      MainWrapper.routeName: (ctx) => MainWrapper(),

      },
      ),
    );
  }
}
