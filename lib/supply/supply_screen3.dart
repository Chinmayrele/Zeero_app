
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:zeero/home/home_screen.dart';
// import 'package:zeero/math_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:zeero_app/math_utils.dart';
import '../leads/leads1.dart';
import '../provider.dart';
import '../size_config.dart';

class SupplyScreen3 extends StatefulWidget {
  static String routeName = "/supply3";
  const SupplyScreen3({Key? key}) : super(key: key);

  @override
  State<SupplyScreen3> createState() => _SupplyScreen3State();
}

class _SupplyScreen3State extends State<SupplyScreen3> {
  TextEditingController controller = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  List Supply3 =[];

  @override
  Widget build(BuildContext context) {
    return Consumer<FormModel>(builder: (context, cart, child)
    {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            "Step 3 of 3",
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
        body: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Optional Details",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey,
              ),

              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white, width: 1.0,)
                ),
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  style: TextStyle(
                      color: Colors.white
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Other Info.",
                      hintStyle: TextStyle(
                          color: Colors.grey, fontSize: 18
                      ),
                      contentPadding: EdgeInsets.only(
                          left: getHorizontalSize(10),
                          top: getVerticalSize(10),
                          bottom: getVerticalSize(10))
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),

                child: TextFormField(
                  controller: unitController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Unit Number",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber.shade600),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  maxLines: 1,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),

                child: TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Owner Name",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber.shade600),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  maxLines: 1,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),

                child: TextFormField(
                  controller: contactController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Owner Contact",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber.shade600),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  maxLines: 1,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.amber.shade600,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextButton(
                  child: Text("Next",style: TextStyle(color: Colors.black,fontSize: getFontSize(17),fontWeight: FontWeight.w500),),
                  onPressed: () {
                    setState(() {
                      cart.addAllSupply(controller.text,unitController.text,nameController.text,contactController.text,
                        cart.supply1[0]["choice"],cart.supply1[0]["property"],cart.supply1[0]["type"],cart.supply1[0]["city"]
                        ,cart.supply1[0]["locality"],cart.supply1[0]["society"],cart.supply1[0]["date"],cart.supply1[0]["amenities"],cart.supply2[0]["images"],
                        cart.supply2[0]["layout"],cart.supply2[0]["washroom"],cart.supply2[0]["balcony"]
                        ,cart.supply2[0]["carpet"],cart.supply2[0]["floor"],cart.supply2[0]["rent"],cart.supply2[0]["security"]
                      );
                    });
                    print(cart.supplyAll);
                    Navigator.of(context).pushNamed(Leads.routeName);


                  },
                ),
              ),

            ],
          ),
        ),
      );
    });
  }
}
