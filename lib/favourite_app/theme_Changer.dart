import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/favourite_app/theme_Changer_provider.dart';

class ThemeChanger extends StatefulWidget {
  const ThemeChanger({Key? key}) : super(key: key);

  @override
  State<ThemeChanger> createState() => _ThemeChangerState();
}

class _ThemeChangerState extends State<ThemeChanger> {
  @override
  Widget build(BuildContext context) {
    final themChanger = Provider.of<ThemeChangerProvider>(context);
    print('hi');
    return Scaffold(
      appBar: AppBar(title: const Text('Theme Changer')),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
              title: const Text('Light'),
              value: ThemeMode.light,
              groupValue: themChanger.thememode,
              onChanged: themChanger.setTheme),
          RadioListTile<ThemeMode>(
              title: const Text('Dark'),
              value: ThemeMode.dark,
              groupValue: themChanger.thememode,
              onChanged: themChanger.setTheme),
          RadioListTile<ThemeMode>(
              title: const Text('System'),
              value: ThemeMode.system,
              groupValue: themChanger.thememode,
              onChanged: themChanger.setTheme),
          TextButton(
              onPressed: () {
                themChanger.setTheme(ThemeMode.dark);
              },
              child: Text('Dark'))
        ],
      ),
    );
  }
}
