import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tdd_poc/presentation/screens/home_screen/home_screen.dart';
import 'package:tdd_poc/presentation/screens/home_screen/home_screen_controller.dart';

import 'dependency_injection.dart';

void main() {
  DependencyInjection.setupLocator();
  runApp(const TDDApp());
}

class TDDApp extends StatelessWidget {
  const TDDApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => sl<HomeScreenController>(),
          ),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}
