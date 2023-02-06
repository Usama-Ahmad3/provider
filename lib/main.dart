import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/favourite_app/favouriteProvider.dart';
import 'package:untitled/favourite_app/stateless.dart';
import 'package:untitled/favourite_app/theme_Changer.dart';
import 'package:untitled/provider.dart';

import 'example_2 provider.dart';
import 'favourite_app/theme_Changer_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => Exmaple_2P()),
          ChangeNotifierProvider(create: (_) => FavouriteProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
        ],
        child: Builder(
          builder: (context) {
            final themeChanger = Provider.of<ThemeChangerProvider>(context);
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              themeMode: themeChanger.thememode,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              darkTheme: ThemeData(brightness: Brightness.dark),
              home: Counte(),
            );
          },
        ));
  }
}

class ProviderCount extends StatefulWidget {
  const ProviderCount({Key? key}) : super(key: key);

  @override
  State<ProviderCount> createState() => _ProviderCountState();
}

class _ProviderCountState extends State<ProviderCount> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final providercontext = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      providercontext.setGinti();
    });
  }

  @override
  Widget build(BuildContext context) {
    final providercontext = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Class'),
      ),
      body: Column(
        children: [
          Consumer<CountProvider>(builder: (context, value, child) {
            return Center(child: Text(value.count.toString()));
          }),
          Consumer<CountProvider>(
            builder: (context, value, child) => Text(value.ginti.toString()),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          providercontext.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
