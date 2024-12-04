import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'package:realm_poc/providers/add_user_form_provider.dart';
import 'package:realm_poc/providers/bottom_navgation_bar_provider.dart';
import 'package:realm_poc/screens/home.dart';

void main() async {

 WidgetsFlutterBinding.ensureInitialized();


  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavigationBarProvider()),
        ChangeNotifierProvider(create: (context) => AddUserFormProvider()),
      ],
      child: const MyApp(),
    ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.blue, // Sets the primary color to blue
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.blue, // Primary color
          secondary: Colors.blueAccent, // Secondary color (Accent color)
        ),
        scaffoldBackgroundColor: Colors.white, // Optional: Set background color
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black, // Text color
              displayColor: Colors.black, // Headings color
            ),
      ),
    );
  }
}

