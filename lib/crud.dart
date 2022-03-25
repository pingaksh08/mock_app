import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

String name = "";
String marks = "";
int age = 0;
int rollno = 0;

List data = [];
String val1 = "";
String val2 = "";
String val3 = "";
String val4 = "";

class crudop extends StatefulWidget {
  const crudop({Key? key}) : super(key: key);

  @override
  State<crudop> createState() => _crudopState();
}

class _crudopState extends State<crudop> {
  //TextEditingController txt = TextEditingController();
  CollectionReference ref = FirebaseFirestore.instance.collection('Students');

  final Stream<QuerySnapshot> Students =
      FirebaseFirestore.instance.collection('Students').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 40),
        color: Colors.amber,
        child: Column(
          children: [
            TextFormField(
              //controller: txt,
              decoration: InputDecoration(hintText: 'name'),
              onChanged: (val) {
                setState(() {
                  name = val;
                });
              },
            ),
            TextFormField(
              //controller: txt,
              decoration: InputDecoration(hintText: 'age'),
              onChanged: (val) {
                setState(() {
                  age = int.parse(val);
                });
              },
            ),
            TextFormField(
              //controller: txt,
              decoration: InputDecoration(hintText: 'marks'),
              onChanged: (val) {
                setState(() {
                  marks = val;
                });
              },
            ),
            TextFormField(
              //controller: txt,
              decoration: InputDecoration(hintText: 'roll no'),
              onChanged: (val) {
                setState(() {
                  rollno = int.parse(val);
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                await ref.add({
                  'name': name,
                  'marks': marks,
                  'rollno': rollno,
                  'age': age,
                }).then((value) => print('user added'));
              },
              child: Text('fill'),
            ),
            ElevatedButton(
                onPressed: () async {
                  DocumentSnapshot variable = await FirebaseFirestore.instance
                      .collection('Students')
                      .doc('66ODZRWR07NCWwoBYoG5')
                      .get();
                  val1 = variable['name'].toString();
                  val2 = variable['marks'].toString();
                  val3 = variable['rollno'].toString();
                  val4 = variable['age'].toString();
                  // print(variable['name']);
                },
                child: Text('show')),
            SizedBox(
              height: 10,
            ),
            Text(val1),
            SizedBox(
              height: 10,
            ),
            Text(val2),
            SizedBox(
              height: 10,
            ),
            Text(val3),
            SizedBox(
              height: 10,
            ),
            Text(val4),
            // StreamBuilder<QuerySnapshot>(
            // stream: Students,
            // builder: (BuildContext context , AsyncSnapshot<QuerySnapshot> snapshot){
            // if(snapshot.hasError){
            // return Text("something is wrong");
            // }
            // if(snapshot.connectionState == ConnectionState.waiting){
            // return Text('loading');
            // }
            // final data = snapshot.requireData;
            // print(data);
            // return ListView.builder(
            // itemCount: data.size,
            // itemBuilder: (context , index){
            // return Text("name = data.docs[index]['name']");
            // },
            // );
            // },
            // ),
          ],
        ),
      ),
    );
  }
}
