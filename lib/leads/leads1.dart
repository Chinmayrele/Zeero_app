import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:zeero/math_utils.dart';
import 'dart:io';


import '../math_utils.dart';
import '../provider.dart';

class Leads extends StatefulWidget {
  static String routeName = "/leads";

  const Leads({Key? key}) : super(key: key);

  @override
  State<Leads> createState() => _LeadsState();
}

class _LeadsState extends State<Leads> {
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<FormModel>(builder: (context, cart, child)
    {

      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Leeds",
            style: TextStyle(color: Colors.amber.shade600),
          ),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              icon: Image.asset("assets/images/logo_zoom.png"),
              onPressed: () {},
              iconSize: 120,
            ),
          ],
        ),
        backgroundColor: Colors.black,
        body: Container(
          margin: EdgeInsets.only(left: getHorizontalSize(10),right: getHorizontalSize(10),top: getVerticalSize(20)),
          child: ListView.builder(
            itemCount: cart.supplyAll.length,
              itemBuilder: (BuildContext context , index){
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,

                  ),
                  height: getVerticalSize(115),
                  margin: EdgeInsets.symmetric(vertical: getVerticalSize(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: getHorizontalSize(120),
                        child: Image.file(File(cart.supplyAll[index]["images"][0]),
                        fit: BoxFit.cover,),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:getHorizontalSize(10),top: getVerticalSize(5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.currency_rupee_outlined,size: 17,),
                                Text(
                                    cart.supplyAll[index]["rent"],style: TextStyle(color: Colors.black,fontSize: getFontSize(15),fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: getVerticalSize(3)),
                              child: Text(cart.supplyAll[index]["layout"]+cart.supplyAll[index]["type"],style: TextStyle(color: Colors.black54,fontSize: getFontSize(12))),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: getVerticalSize(6)),
                              child: Text(cart.supplyAll[index]["society"],style: TextStyle(color: Colors.black,fontSize: getFontSize(15),fontWeight: FontWeight.w500)),
                            ),
                                Padding(
                                  padding: EdgeInsets.only(top: getVerticalSize(1),bottom: getVerticalSize(5)),
                                  child: Text(cart.supplyAll[index]["locality"]+", "+cart.supplyAll[index]["city"],style: TextStyle(color: Colors.black54,fontSize: getFontSize(16)),
                                ),
                                ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(width: 0.5,color: Colors.black,),
                                    color: Colors.amber,
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: getVerticalSize(5),horizontal: getHorizontalSize(20)),
                                  alignment: Alignment.center,
                                  child: Text("Save",style: TextStyle(color: Colors.black,fontSize: getFontSize(15)),),
                                ) ,
                                SizedBox(
                                  width: getHorizontalSize(20),
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(width: 0.5,color: Colors.black,),
                                    color: Colors.amber,
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: getVerticalSize(5),horizontal: getHorizontalSize(10)),
                                  alignment: Alignment.center,
                                  child: Text("Get Phone No.",style: TextStyle(color: Colors.black,fontSize: getFontSize(15)),),
                                )
                              ],
                            )
                            
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }

          ),
        )
      );
    });
  }

}
