import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pintsize/Screens/Home/subPages/awareness.dart';
import 'package:firebase_database/firebase_database.dart';

class AwarenessPage extends StatelessWidget {
  final databaseReference = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    readData();
    var size = MediaQuery.of(context).size;

    var query = databaseReference.child('Awareness').orderByChild('id');
    query.onChildAdded.forEach((event) => {print(event.snapshot.value)});

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: new Container(
        child: StreamBuilder(
          stream:
              // databaseReference.child("Awareness").onValue,
              FirebaseFirestore.instance.collection('Awareness').snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (!snapshot.hasData) return const SizedBox.shrink();
            return GridView.builder(
                itemCount: snapshot.data!.docs.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 5)),
                itemBuilder: (BuildContext context, int index) {
                  final databaseQuery = snapshot.data!.docs[index].data();
                  return _buildCard(databaseQuery['title'],
                      databaseQuery['description'], context);
                });
          },
        ),
      ),
    );
  }

  void readData() {
    databaseReference
        .child(
            '1wWNoeTvLN4SEQ02eKVYM94mLymsNMq-UB8Cx3AATunw/Cbs_Donoation_Data')
        .once()
        .then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }
}

Widget _buildCard(String title, String description, context) {
  return Padding(
      padding:
          EdgeInsets.only(top: 10.0, bottom: 15.0, left: 45.0, right: 45.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HomeAwarenessSubPage(
                  documentTitle: title, documentDescription: description)));
        },
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3.0,
                      blurRadius: 5.0)
                ],
                color: Colors.white),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: 1.0),
              Align(
                alignment: Alignment.center,
                child: Text(title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFCC8053),
                        fontFamily: 'Varela',
                        fontSize: 14.0)),
              ),
            ])),
      ));
}
