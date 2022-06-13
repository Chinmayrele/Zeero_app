import 'package:flutter/material.dart';
// import 'package:zeero/size_config.dart';

import '../size_config.dart';
import 'components/drawer.dart';
import 'components/tab_bar.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: IconButton(
          icon: Image.asset("assets/images/logo_zoom.png"),
          onPressed: () {},
          iconSize: 120,
        ),
      ),
      body: TabBarWidget(),
    );
  }
}
