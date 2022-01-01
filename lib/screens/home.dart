import 'package:bigo_task/components/home_card.dart';
import 'package:bigo_task/globals.dart';
import 'package:bigo_task/models/HomeModel.dart';
import 'package:bigo_task/services/api.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String filter = '';
  List<HomeModel>? houses;

  @override
  void initState() {
    super.initState();
    _populateData();
  }

  _populateData() async {
    try {
      var tmp = await ApiService.fetchHouses();
      setState(() {
        houses = tmp;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0],
            colors: [globals.accentColor, Colors.white30],
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: houses == null
                  ? Center(child: CircularProgressIndicator())
                  : Stack(children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            renderTopPortion(),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(top: 30, left: 20),
                              child: Text(
                                globals.t('homesNearby'),
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            renderHomesNearby(),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(top: 30, left: 20),
                              child: Text(
                                globals.t('trending'),
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            renderHomesNearby()
                          ],
                        ),
                      ),
                      Positioned(
                          left: -43,
                          top: 160,
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(55 / 360),
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration:
                                  BoxDecoration(color: globals.secondryColor, borderRadius: BorderRadius.circular(5)),
                            ),
                          ))
                    ]),
            )));
  }

  renderTopPortion() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // <====== Header row =======>
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    globals.t('location'),
                    style: TextStyle(color: globals.grayColor),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Lahore, Pakistan',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: globals.appMainColor),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.place_outlined,
                        color: globals.grayColor,
                      )
                    ],
                  )
                ],
              ),
              CircleAvatar(
                child: Icon(Icons.face),
                radius: 25,
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              globals.t('whatWanted'),
              style: TextStyle(fontSize: 24),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  clipBehavior: Clip.hardEdge,
                  margin: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    color: Color(0xFFf0f8fe),
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        color: globals.grayColor,
                        size: 26,
                      ),
                      hintText: globals.t('searchHint'),
                    ),
                  ),
                ),
              ),
              Container(
                  width: 45,
                  height: 50,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.tune,
                        color: Colors.grey.shade600,
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                      )))
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              createButton(Icons.shop, globals.t('buy'), () {}),
              createButton(Icons.sell, globals.t('sell'), () {}),
              createButton(Icons.attach_money, globals.t('rent'), () {})
            ],
          )
        ],
      ),
    );
  }

  renderHomesNearby() {
    // return ListView();
    return Container(
      height: 260,
      margin: EdgeInsets.only(top: 20),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: houses?.length,
          itemBuilder: (context, index) {
            return HomeCard(houses?[index] as HomeModel);
          }),
    );
  }

  createButton(icon, title, onClick) {
    return Expanded(
      child: Container(
        height: 50,
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: TextButton(
            onPressed: onClick,
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: globals.appMainColor,
                  size: 22,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(title, style: TextStyle(color: Colors.black, fontSize: 18))
              ],
            )),
      ),
    );
  }
}
