import 'package:bloc_test/src/feature/no_internet/no_internet_screen.dart';

import 'src/feature/character/view/character_details_screen.dart';
import 'src/feature/character/view/character_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    ShowCharactersApp(),
  );
}

class ShowCharactersApp extends StatefulWidget {
  const ShowCharactersApp({super.key});

  @override
  State<ShowCharactersApp> createState() => _ShowCharactersAppState();
}

class _ShowCharactersAppState extends State<ShowCharactersApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: CharacterScreen.routeName,
      routes: {
        CharacterScreen.routeName: (context) => CharacterScreen(),
        CharacterDetailsScreen.routeName: (context) => CharacterDetailsScreen(),
        NoInternetScreen.routeName: (context) => NoInternetScreen(),
      },
    );
  }
}
