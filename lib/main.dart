import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeero_app/home/home_screen.dart';
import 'package:zeero_app/login/login_screen.dart';
import 'package:zeero_app/provider.dart';
import 'package:zeero_app/search/search1.dart';
import 'package:zeero_app/supply/supply_screen1.dart';
import 'package:zeero_app/supply/supply_screen2.dart';
import 'package:zeero_app/supply/supply_screen3.dart';

import 'leads/leads1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => FormModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zeero',
      home: const LoginScreen(),
      routes: {
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        // OtpScreen.routeName: (ctx) => const OtpScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        SupplyScreen1.routeName: (ctx) => SupplyScreen1(),
        SupplyScreen2.routeName: (ctx) => SupplyScreen2(),
        SupplyScreen3.routeName: (ctx) => const SupplyScreen3(),
        Search1.routeName: (ctx) => const Search1(),
        Leads.routeName: (ctx) => const Leads(),
      },
    );
  }
}
