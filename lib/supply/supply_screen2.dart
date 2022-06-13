
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:zeero/math_utils.dart';
import 'package:path/path.dart';
import 'package:zeero_app/math_utils.dart';
import 'package:zeero_app/supply/supply_screen3.dart';
import '../provider.dart';
import '../size_config.dart';
import 'dart:io';
// import 'package:zeero/supply/supply_screen3.dart';

class SupplyScreen2 extends StatefulWidget {
  static String routeName = "/supply2";

  @override
  State<SupplyScreen2> createState() => _SupplyScreen2State();
}

class _SupplyScreen2State extends State<SupplyScreen2> {
  String text='';

  bool selected = false;
  int defaultChoiceIndex =8;
  int defaultChoiceIndex1 =4;
  int defaultChoiceIndex2 =4;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String? _imagepath;



  TextEditingController carpetController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController rentController = TextEditingController();
  TextEditingController SecurityController = TextEditingController();


  List layoutType=["1 BHK","2 BHK","3 BHK","4 BHK","More than 4BHK"];
  List washroom=["1","2","3","More than 3"];
  List balcony=["0","1","2","3"];
  String layout = '';
  String Washroom = '';
  String Balcony = '';
  List imagepaths =[];
  List images = [];

  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;
  void openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      if(pickedfiles != null){
        imagefiles = pickedfiles;
        final directory = await getApplicationDocumentsDirectory();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        // for(XFile img in imagefiles!) {
        //   final name = basename(img.path);
        //   final image = File('${directory.path}/$name');
        //   final savedImage = File(img.path).copy(image.path);
        //   for(int i =1;i<=imagefiles!.length;i++){
        //     prefs.setString('image$i', savedImage.toString());
        //   }
        // }
        setState(() {
        });
      }else{
        print("No image is selected.");
      }
    }catch (e) {
      print("error while picking file.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FormModel>(builder: (context, cart, child)
    {
      // _loadimage();

      return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            "Step 2 of 3",
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
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: const Text(
                  "Advance Details",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  openImages();
                },
                child: Container(
                  margin: EdgeInsets.only(right: getHorizontalSize(200)),
                  height: getVerticalSize(42),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 1),
                      color: Colors.amber.shade600
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Add Photos", style: TextStyle(fontSize: getFontSize(20),
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),),
                ),
              ),
              imagefiles != null ? Padding(
                padding: EdgeInsets.all(8),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: getHorizontalSize(
                      5.00,
                    ),
                    crossAxisSpacing: getHorizontalSize(
                      5.00,
                    ),
                  ),
                  itemCount: imagefiles?.length,
                  itemBuilder: (context, int index) {
                    return Card(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)
                        ),
                        height: 100, width: 110,
                        child: Image.file(File(imagefiles![index].path),
                          fit: BoxFit.cover,),
                      ),
                    );
                  },
                ),
              )
                  : Container(),
              SizedBox(
                height: 10,
              ),
              Text(
                "Layout-",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 10,
                children: List.generate(layoutType.length, (index) {
                  return ChoiceChip(
                    labelPadding: EdgeInsets.all(2.0),
                    label: Text(
                      layoutType[index],
                      style: TextStyle(color: defaultChoiceIndex == index
                          ? Colors.black
                          : Colors.white, fontSize: 14),
                    ),
                    selected: defaultChoiceIndex == index,
                    backgroundColor: Colors.black,
                    selectedColor: Colors.amber.shade600,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: defaultChoiceIndex == index
                              ? Colors.grey
                              : Colors.white,
                          width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onSelected: (value) {
                      setState(() {
                        defaultChoiceIndex = value ? index : defaultChoiceIndex;
                        layout = layoutType[index];
                      });
                    },
                    // backgroundColor: color,
                    elevation: 1,
                    padding: EdgeInsets.symmetric(
                        horizontal: 10),
                  );
                }),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "WashRoom-",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 10,
                children: List.generate(washroom.length, (index) {
                  return ChoiceChip(
                    labelPadding: EdgeInsets.all(4.0),
                    label: Text(
                      washroom[index],
                      style: TextStyle(color: defaultChoiceIndex1 == index
                          ? Colors.black
                          : Colors.white, fontSize: 14),
                    ),
                    selected: defaultChoiceIndex1 == index,
                    backgroundColor: Colors.black,
                    selectedColor: Colors.amber.shade600,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: defaultChoiceIndex1 == index
                              ? Colors.grey
                              : Colors.white,
                          width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onSelected: (value) {
                      setState(() {
                        defaultChoiceIndex1 =
                        value ? index : defaultChoiceIndex1;
                        Washroom = washroom[index];
                      });
                    },
                    // backgroundColor: color,
                    elevation: 1,
                    padding: EdgeInsets.symmetric(
                        horizontal: 10),
                  );
                }),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Balcony-",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 10,
                children: List.generate(balcony.length, (index) {
                  return ChoiceChip(
                    labelPadding: EdgeInsets.all(4.0),
                    label: Text(
                      balcony[index],
                      style: TextStyle(color: defaultChoiceIndex2 == index
                          ? Colors.black
                          : Colors.white, fontSize: 14),
                    ),
                    selected: defaultChoiceIndex2 == index,
                    backgroundColor: Colors.black,
                    selectedColor: Colors.amber.shade600,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: defaultChoiceIndex2 == index
                              ? Colors.grey
                              : Colors.white,
                          width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onSelected: (value) {
                      setState(() {
                        defaultChoiceIndex2 =
                        value ? index : defaultChoiceIndex2;
                        Balcony = balcony[index];
                      });
                    },
                    // backgroundColor: color,
                    elevation: 1,
                    padding: EdgeInsets.symmetric(
                        horizontal: 10),
                  );
                }),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),

                child: TextFormField(
                  controller: carpetController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Carpet Area (in sq. feet)",
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
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),

                child: TextFormField(
                  controller: floorController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Floor Number",
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
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),

                child: TextFormField(
                  controller: rentController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Rent/Price",
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
                height: 10,
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),

                child: TextFormField(
                  controller: SecurityController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Security Deposit ",
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
                height: 10,
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
                    for(int i=0;i<imagefiles!.length;i++){
                      images.add(imagefiles![i].path);
                    }
                    setState(() {});
                    Navigator.of(context).pushNamed(SupplyScreen3.routeName);
                    cart.addSupply2(images,layout, Washroom, Balcony, carpetController.text, floorController.text, rentController.text, SecurityController.text);
                    print(imagefiles![0].path);

                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      );
    });
  }
  // void _loadimage() async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     for(int i =1;i<=imagefiles!.length;i++){
  //       imagepaths.add(prefs.getString("image$i"));
  //     }
  //
  //   });
  // }
}
