import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/home_screen.dart';
import '../math_utils.dart';
import '../size_config.dart';
import 'filters.dart';
import 'package:intl/intl.dart';


class Search1 extends StatefulWidget {
  static String routeName = "/search1";

  const Search1({Key? key}) : super(key: key);

  @override
  State<Search1> createState() => _Search1State();
}

class _Search1State extends State<Search1> {
  List<String> _choicesList = ['Buy', 'Rent'];
  List layoutType=["1 BHK","2 BHK","3 BHK","4 BHK","More than 4BHK"];


  int defaultChoiceIndex=3;
  bool selectAppartment = false;
  bool selectVilla = false;
  bool selectBuilderFloor = false;
  bool more = false;
  DateTime currentDate = DateTime.now();
  var myFormat = DateFormat("yMMMd");
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
  int defaultChoiceIndex1 =4;
  int defaultChoiceIndex2 =4;
  List washroom=["1","2","3","More than 3"];
  List balcony=["0","1","2","3"];
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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Search Filters",
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
              "Looking To-",
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
                    style: TextStyle(color: defaultChoiceIndex == index?Colors.black:Colors.white, fontSize: 14),
                  ),
                  selected: defaultChoiceIndex == index,
                  backgroundColor: Colors.black,
                  selectedColor: Colors.amber.shade600,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: defaultChoiceIndex == index ? Colors.grey : Colors.white,
                        width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onSelected: (value) {
                    setState(() {
                      defaultChoiceIndex = value ? index : defaultChoiceIndex;
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),

              child: TextFormField(
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
              children: <Widget>[
                FilterChip(
                  onSelected: (value) {
                    setState(() {
                      selectAppartment = value;
                    });
                  },
                  selected: selectAppartment,
                  selectedColor: Colors.amber.shade600,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: selectAppartment ? Colors.grey : Colors.white,
                        width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text(
                    "Appartment",
                    style: TextStyle(
                        color: selectAppartment ? Colors.black : Colors.white),
                  ),
                  backgroundColor: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                FilterChip(
                  onSelected: (value) {
                    setState(() {
                      selectVilla = value;
                    });
                  },
                  selected: selectVilla,
                  selectedColor: Colors.amber.shade600,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: selectVilla ? Colors.grey : Colors.white,
                        width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text(
                    "Villa/House",
                    style: TextStyle(
                        color: selectVilla ? Colors.black : Colors.white),
                  ),
                  backgroundColor: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                FilterChip(
                  onSelected: (value) {
                    setState(() {
                      selectBuilderFloor = value;
                    });
                  },
                  selected: selectBuilderFloor,
                  selectedColor: Colors.amber.shade600,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: selectBuilderFloor ? Colors.grey : Colors.white,
                        width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text(
                    "Builder Floor",
                    style: TextStyle(
                        color:
                        selectBuilderFloor ? Colors.black : Colors.white),
                  ),
                  backgroundColor: Colors.black,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),

              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Budget",
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
                    style: TextStyle(color: defaultChoiceIndex == index?Colors.black:Colors.white, fontSize: 14),
                  ),
                  selected: defaultChoiceIndex == index,
                  backgroundColor: Colors.black,
                  selectedColor: Colors.amber.shade600,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: defaultChoiceIndex == index ? Colors.grey : Colors.white,
                        width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onSelected: (value) {
                    setState(() {
                      defaultChoiceIndex = value ? index : defaultChoiceIndex;
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
            SizedBox(
              height: 10,
            ),
            more?Container():GestureDetector(
              onTap: (){
                setState(() {
                  more = true;
                });
              },
              child: Text(
                "More Filters",textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            more?Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Needed From-",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(15)),
                  height: getVerticalSize(60),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.amber.shade600),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(myFormat.format(currentDate).toString(),style: TextStyle(color: Colors.white,fontSize: getFontSize(20)), ),

                      GestureDetector(
                          onTap: (){
                            _selectDate(context);
                          },
                          child: Icon(Icons.calendar_month,color: Colors.white,size: 30,))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Amenities",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                  children: [
                    for(int i=0;i<thumbType.length;i++) _listItem(i)
                  ],
                ),
                SizedBox(
                  height: 20,
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
                      labelPadding: EdgeInsets.all(8.0),
                      label: Text(
                        washroom[index],
                        style: TextStyle(color: defaultChoiceIndex1 == index?Colors.black:Colors.white, fontSize: 14),
                      ),
                      selected: defaultChoiceIndex1 == index,
                      backgroundColor: Colors.black,
                      selectedColor: Colors.amber.shade600,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: defaultChoiceIndex1 == index ? Colors.grey : Colors.white,
                            width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onSelected: (value) {
                        setState(() {
                          defaultChoiceIndex1 = value ? index : defaultChoiceIndex1;
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
                      labelPadding: EdgeInsets.all(8.0),
                      label: Text(
                        balcony[index],
                        style: TextStyle(color: defaultChoiceIndex2 == index?Colors.black:Colors.white, fontSize: 14),
                      ),
                      selected: defaultChoiceIndex2 == index,
                      backgroundColor: Colors.black,
                      selectedColor: Colors.amber.shade600,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: defaultChoiceIndex2 == index ? Colors.grey : Colors.white,
                            width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onSelected: (value) {
                        setState(() {
                          defaultChoiceIndex2 = value ? index : defaultChoiceIndex2;
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


              ],
            )
            :Container(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: AnimatedButton(
                text: "Find",
                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                onPress: () {
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                },
                backgroundColor: Colors.amber.shade600,
                transitionType: TransitionType.CENTER_ROUNDER,
                borderRadius: 10,
                selectedBackgroundColor: Colors.amber.shade600,
                selectedTextColor: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
