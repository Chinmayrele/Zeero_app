import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:provider/provider.dart';
// import 'package:zeero/size_config.dart';
// import 'package:zeero/supply/supply_screen2.dart';
import 'package:intl/intl.dart';
import 'package:zeero_app/size_config.dart';
import 'package:zeero_app/supply/supply_screen2.dart';

import '../math_utils.dart';
import '../provider.dart';

class  SupplyScreen1 extends StatefulWidget {
  static String routeName = "/supply1";

  @override
  State<SupplyScreen1> createState() => _SupplyScreen1State();
}

class _SupplyScreen1State extends State<SupplyScreen1> {
  int defaultChoiceIndex=4;
  int defaultChoiceIndex1=4;
  int defaultChoiceIndex2=4;
  String choice="";
  String property="";
  String type="";
  TextEditingController cityController = TextEditingController();
  TextEditingController localityController = TextEditingController();
  TextEditingController societyController = TextEditingController();
  DateTime currentDate = DateTime.now();
  var myFormat = DateFormat("yMMMd");
  List<String> _choicesList = ['Sell', 'Rent/Lease', 'Paying Guest'];
  List<String> _property = ['Residential', 'Commercial'];
  List<String> _propertytype = ['Apartment', 'Villa/House', 'Builder Floor'];
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialEntryMode: DatePickerEntryMode.calendar,
        initialDate: currentDate,
        firstDate: currentDate,
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }
  var thumbType=["Open parking","Covered Parking","Lift","Security Guards","Power Backup","Gym","Park","Swimming Pool","Clubhouse","Gas Pipeline"];
  List<bool> selectedList=[];
  List<String> selectedLanguage=[];
  Widget _listItem(int i) {
    selectedList.add(false);
    return Container(
      margin: EdgeInsets.only(left: 6,right: 6,top: 3,bottom: 3),
      child: FilterChip(
        selectedColor: Colors.amber.shade600,
        backgroundColor: Colors.black12,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        label: Text(thumbType[i]),
        selected: selectedList[i],
        onSelected: (bool value) {
          setState(() {
            if(value){
              selectedLanguage.add(thumbType[i]);
            }else{
              selectedLanguage.remove(thumbType[i]);
            }
            selectedList[i]=value;
            //get selected language
            debugPrint("selected Language :  $selectedLanguage");
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FormModel>(builder: (context, cart, child)
    {
      final arguments = (ModalRoute
          .of(context)
          ?.settings
          .arguments ?? <String, dynamic>{}) as Map;
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            "Step 1 of 3",
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
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  "Add Basic Details",
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
              Text(
                "You are looking to?",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 10,
                children: List.generate(_choicesList.length, (index) {
                  return ChoiceChip(
                    labelPadding: EdgeInsets.all(2.0),
                    label: Text(
                      _choicesList[index],
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
                        choice = _choicesList[index];
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
                "What kind of property?",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 10,
                children: List.generate(_property.length, (index) {
                  return ChoiceChip(
                    labelPadding: EdgeInsets.all(2.0),
                    label: Text(
                      _property[index],
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
                        defaultChoiceIndex1 = value ? index : defaultChoiceIndex1;
                        property = _property[index];
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
                "Select Property Type",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 10,
                children: List.generate(_propertytype.length, (index) {
                  return ChoiceChip(
                    labelPadding: EdgeInsets.all(2.0),
                    label: Text(
                      _propertytype[index],
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
                        defaultChoiceIndex2 = value ? index : defaultChoiceIndex2;
                        type = _propertytype[index];
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
                height: 30,
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),

                child: TextFormField(
                  controller: cityController,
                  decoration: InputDecoration(
                    labelText: "City",
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
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),

                child: TextFormField(
                  controller: localityController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Locality/Sector",
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
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),

                child: TextFormField(
                  controller:societyController,
                  decoration: InputDecoration(
                    labelText: "Society Name",
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
                height: 20,
              ),
              Text(
                "Available From-",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.symmetric(
                    horizontal: getHorizontalSize(15)),
                height: getVerticalSize(60),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber.shade600),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(myFormat.format(currentDate).toString(),
                      style: TextStyle(
                          color: Colors.white, fontSize: getFontSize(20)),),

                    GestureDetector(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Icon(
                          Icons.calendar_month, color: Colors.white, size: 30,))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Society Details-",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
                children: [
                  for(int i = 0; i < thumbType.length; i++) _listItem(i)
                ],
              ),
              SizedBox(
                height: 20,
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
                      cart.addSupply1(choice, property, type, cityController.text, localityController.text,
                          societyController.text, myFormat.format(currentDate).toString(), selectedLanguage);
                    });
                   print(cart.supply1);
                    Navigator.of(context).pushNamed(SupplyScreen2.routeName);

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
}
