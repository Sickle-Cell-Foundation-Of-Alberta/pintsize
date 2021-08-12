import 'package:flutter/material.dart';
import 'package:pintsize/Screens/Donations/donation.dart';
import 'package:pintsize/Widgets/bottomNav/bottomBar.dart';

class BloodDonationSubPage extends StatelessWidget {
  final documentTitle, documentUrl;

  BloodDonationSubPage({this.documentTitle, this.documentUrl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        centerTitle: true,
        title: Text("Campaigns",
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFFFCFAF8))),
      ),
      body: ListView(children: [
        SizedBox(height: 45.0),
        SizedBox(height: 15.0),
        Center(
            child: Padding(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        )),
        SizedBox(height: 20.0),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DonationScreen()));
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.bloodtype_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}