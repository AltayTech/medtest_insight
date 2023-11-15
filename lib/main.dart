import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:medtest_insight/core/widgets/main_wrapper.dart';
import 'package:medtest_insight/features/scan/presentation/pages/scan_screen.dart';
import 'package:medtest_insight/features/scan/presentation/providers/scan_provider.dart';
import 'package:provider/provider.dart';

import 'features/home_screen/presentation/pages/home_screen.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
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
        },
      ),
    );
  }
}
