import 'package:flutter/material.dart';
import 'package:mock_app/signin.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
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
            TextButton(onPressed: () {}, child: Text('sign in')),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text('sign up')),
            TextButton(onPressed: () {
              Navigator.pushNamed(context, '/crudop');
            }, child: Text('crud')),
          ],
        ),
      ),
    );
  }
}
