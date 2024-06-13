// import 'package:flutter/material.dart';

// class value_pass extends StatelessWidget {
//   final bool isDarkThemeApp;
//   final ValueChanged<bool> onThemeChanged;
//   const value_pass(
//       {super.key, required this.isDarkThemeApp, required this.onThemeChanged});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SwitchListTile(
//         title: Text('Dark Theme'),
//         value: isDarkThemeApp,
//         onChanged: onThemeChanged,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:meditate/screen/provider_class.dart';
import 'package:provider/provider.dart';

class provider_theme extends StatelessWidget {
  const provider_theme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 154, 251),
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return SwitchListTile(
                  activeColor: Color.fromARGB(255, 233, 28, 35),
                  title: Text('Dark Theme'),
                  value: themeProvider.isDarkTheme,
                  onChanged: (value) {
                    themeProvider.toggleTheme(value);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
