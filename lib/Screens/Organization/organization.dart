import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pintsize/Config/backgroundPalette.dart';
import 'package:pintsize/Widgets/bottomNav/bottomBar.dart';

class OrganizationScreen extends StatefulWidget {
  @override
  _OrganizationScreenState createState() => _OrganizationScreenState();
}

class _OrganizationScreenState extends State<OrganizationScreen> {
  SliverAppBar showSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.red,
      floating: true,
      pinned: true,
      snap: false,
      expandedHeight: 140,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              Container(
                height: 250,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox.shrink(),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Palette.moderateRed,
                ),
              ),
              Container(
                  transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundColor: Palette.softOrange,
                              ),
                            ]),
                        SizedBox(height: 10),
                        Text(
                          'NAME',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "BIO",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          // child: CupertinoSlidingSegmentedControl(
                          // groupValue: Text(
                          //   "BIO",
                          //   style: TextStyle(
                          //     fontSize: 15,
                          //   ),
                          // ),
                          // groupValue: _profileSegmentedValue,
                          // thumbColor: KTweeterColor,
                          // backgroundColor: Colors.blueGrey,
                          // children: _profileTabs,
                          // onValueChanged: (i) {
                          //   setState(() {
                          //     _profileSegmentedValue = i;
                          //   });
                          // },
                        ),
                      ]))
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        child: Icon(Icons.bloodtype_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}