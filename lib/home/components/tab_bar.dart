import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:zeero/constants.dart';
// import 'package:zeero/supply/supply_screen1.dart';

import '../../color_constant.dart';
import '../../constants.dart';
import '../../math_utils.dart';
import '../../supply/supply_screen1.dart';
import '../../supply/supply_screen2.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];


  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(item, fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      'No. ${imgList.indexOf(item)} image',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    ))
        .toList();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: <Widget>[
            // construct the profile details widget here
            SizedBox(
              child: Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03),
                child: Column(
                  children: const [
                    Text(
                      'Market Today',
                      style: TextStyle(color: Colors.white, fontSize: 27,
                          fontWeight: FontWeight.w500,decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02),

              child: Container(
                child: CarouselSlider(
                  items: imageSliders,
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
                      ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.map((url) {
                int index = imgList.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Colors.amber.shade600
                        : Colors.white
                  ),
                );
              }).toList(),
            ),

            // the tab bar with two items
            Container(
              margin: EdgeInsets.only(top: getVerticalSize(20)),
              height: 76,
              child: AppBar(
                backgroundColor: Colors.amber,
                bottom:  const TabBar(
                  indicatorWeight: 4,
                  indicatorColor: Colors.white,
                  labelStyle: TextStyle(fontSize: 20),
                  labelColor: Colors.black,
                  tabs: <Widget>[
                    Tab(
                      text: "Demand",
                      icon: Icon(
                        Icons.arrow_upward,
                        color: Colors.green,
                      ),
                    ),
                    Tab(
                      text: "Supply",
                      icon: Icon(
                        Icons.arrow_downward,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // create widgets for each tab bar here
            Expanded(
              child: TabBarView(
                children: [
                  // first tab bar view widget
                  Container(
                    color: kSecondaryColor,
                    child: Center(
                      child: Text(
                        'Demand',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),

                  // second tab bar viiew widget
                  Container(
                    color: kSecondaryColor,
                    child: Center(
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(SupplyScreen1.routeName);
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.amber,
                          size: 30,
                        ),
                        label: Text(
                          "Add details!",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class MyImageView extends StatelessWidget{

  String imgPath;

  MyImageView(this.imgPath);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.network(imgPath),
        )
    );
  }

}