import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {

  final _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'email',
              ),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'password',
              ),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            // TextButton(onPressed: () {}, child: Text('sign in')),
            TextButton(
                onPressed: () async{
                  try{
                    final newuser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                    if(newuser != null){
                      Navigator.pushNamed(context, '/homepage');
                    }
                  }
                  catch(e){
                    print(e);
                  }
                },
                child: Text('sign up')),
          ],
        ),
      ),
    );
  }
}
