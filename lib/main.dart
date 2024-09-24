import 'package:flutter/material.dart';
import 'package:hubtel_coding_challenge/utils/app_provider.dart';
import 'package:hubtel_coding_challenge/screens/bottom_navigator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => AppProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hubtel Coding Challenge',
      
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'NunitoSans'
      ),
      home: const BottomNavigatorPage(),
    );
  }
}
