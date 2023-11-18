import 'package:flutter/material.dart';
import 'package:medtest_insight/features/athentication_feature/presentation/pages/auth_page.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: Colors.black12,
      backgroundColor: Colors.white60,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Text(''
                'Weathry app'),
          ),

          ListTile(
            title: const Text('Login'),
            onTap: () {
              Navigator.of(context).pushNamed(AuthPage.routeName);
            },
          ),
          ListTile(
            title: const Text('Guide'),
            onTap: () {
              // Navigator.of(context).popAndPushNamed(HelpScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
