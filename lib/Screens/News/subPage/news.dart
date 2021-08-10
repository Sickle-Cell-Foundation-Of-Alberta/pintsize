import 'package:flutter/material.dart';
import 'package:pintsize/Screens/Donations/donation.dart';
import 'package:pintsize/Widgets/bottomNav/bottomBar.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsSubPage extends StatelessWidget {
  final documentTitle, documentDescription;

  NewsSubPage({this.documentTitle, this.documentDescription});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text("News",
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
      ),
      body: ListView(children: [
        SizedBox(height: 60.0),
        Center(
            child: Padding(
          padding: EdgeInsets.fromLTRB(35, 5, 35, 5),
          child: Text(documentTitle,
              style: TextStyle(
                  letterSpacing: 1.0,
                  color: Colors.black,
                  fontFamily: 'Varela',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold)),
        )),
        Center(
            child: Padding(
          padding: EdgeInsets.fromLTRB(35, 5, 35, 5),
          child: Text(documentDescription,
              style: TextStyle(
                  height: 1.5,
                  letterSpacing: 1.0,
                  color: Colors.black,
                  fontFamily: 'Varela',
                  fontSize: 24.0)),
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

class NewsSubPageURL extends StatelessWidget {
  final documentTitle, documentDescription, documentUrl;

  NewsSubPageURL(
      {this.documentTitle, this.documentDescription, this.documentUrl});
  @override
  Widget build(BuildContext context) {
    print(documentUrl);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text("News",
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
      ),
      body: ListView(children: [
        SizedBox(height: 60.0),
        Center(
            child: InkWell(
          child: Padding(
            padding: EdgeInsets.fromLTRB(35, 5, 35, 5),
            child: Text(documentTitle,
                style: TextStyle(
                    letterSpacing: 1.0,
                    color: Colors.black,
                    fontFamily: 'Varela',
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold)),
          ),
        )),
        Center(
            child: InkWell(
          child: Padding(
            padding: EdgeInsets.fromLTRB(35, 5, 35, 5),
            child: Text(documentDescription,
                style: TextStyle(
                    height: 1.5,
                    letterSpacing: 1.0,
                    color: Colors.black,
                    fontFamily: 'Varela',
                    fontSize: 24.0)),
          ),
        )),
        Center(
            child: InkWell(
          child: Padding(
            padding: EdgeInsets.fromLTRB(35, 5, 35, 5),
            child: new InkWell(
                child: new Text(documentUrl,
                    style: TextStyle(
                        letterSpacing: 1.0,
                        color: Colors.blue,
                        fontFamily: 'Varela',
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal)),
                onTap: () => launch(documentUrl)),
          ),
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
