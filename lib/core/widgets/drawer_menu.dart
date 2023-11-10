import 'package:flutter/material.dart';

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

          // ListTile(
          //   title: const Text('Home page'),
          //   onTap: () {
          //     Navigator.of(context).pushNamed(MainWrapper.routeName);
          //   },
          // ),
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
