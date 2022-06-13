import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:zeero_app/constants.dart';
import 'package:zeero_app/math_utils.dart';
// import 'package:zeero/constants.dart';
// import 'package:zeero/math_utils.dart';
// import 'package:zeero/supply/supply_screen1.dart';

import '../../search/search1.dart';
import '../../supply/supply_screen2.dart';

class DrawerWidget extends StatefulWidget {
  static String routeName = "/supply3";

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {

  Widget buildListTile(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
        color: Colors.white,
      ),
      title: Text(title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )),
      onTap: tapHandler,
    );
  }

  bool isEnglish = true;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      // width: getHorizontalSize(220),
      child: Column(
        children: <Widget>[
          Container(
            height: getVerticalSize(100),
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            color: Colors.amber,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:EdgeInsets.only(left:getHorizontalSize(10,),top: getVerticalSize(5)),
                  child: Text(
                    "Hello , Yashu",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ),
                FlutterSwitch(
                    width: 60,
                    height: 25 ,
                    valueFontSize: 12,
                    toggleSize: 20,
                    showOnOff: true,
                    activeText: "Eng",
                    inactiveText: "Hin",
                    activeTextColor: Colors.white,
                    inactiveTextColor: Colors.white,
                    activeColor: Colors.black,
                    inactiveColor: Colors.black,
                    value: isEnglish,
                    onToggle: (value) {
                      setState(() {
                        isEnglish = value;
                      });
                    }),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile("Supply", Icons.arrow_downward_outlined, () {}),
          SizedBox(
            height: 5,
          ),
          buildListTile("Match", Icons.arrow_right, () {}),
          SizedBox(
            height: 5,
          ),
          buildListTile("Business", CupertinoIcons.briefcase, () {}),
          SizedBox(
            height: 5,
          ),
          buildListTile("Leads", Icons.arrow_upward, () {}),
          SizedBox(
            height: 5,
          ),
          buildListTile("Search", Icons.search, () {
            Navigator.of(context).pushNamed(Search1.routeName);


          }),
          SizedBox(
            height: 5,
          ),
          buildListTile("Contact Us", Icons.account_circle, () {

          }),
          SizedBox(
            height: 5,
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text("\u{00a9} 2022 Zeero",
                style: TextStyle(fontSize: 15, color: kPrimaryLightColor)),
          ),
        ],
      ),
    );
  }
}
