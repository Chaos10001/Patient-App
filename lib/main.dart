import 'package:flutter/material.dart';
import 'package:patient_app/onboarding/onboarding1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const Onboarding1(),
    );
  }
}
