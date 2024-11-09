import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meditest/core/widgets/main_wrapper.dart';
import 'package:meditest/features/athentication_feature/presentation/pages/auth_page.dart';
import 'package:meditest/features/athentication_feature/presentation/providers/authentication_provider.dart';
import 'package:meditest/features/scan/presentation/pages/scan_screen.dart';
import 'package:meditest/features/scan/presentation/providers/scan_provider.dart';
import 'package:provider/provider.dart';

import 'features/home_screen/presentation/pages/home_screen.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ScanProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthenticationProvider(),
        ),
      ],
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
          ScanScreen.routeName: (ctx) => ScanScreen(),
          AuthPage.routeName: (ctx) => AuthPage(),
        },
      ),
    );
  }
}
