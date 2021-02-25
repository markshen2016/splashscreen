import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Registration extends StatefulWidget {
  static const String id = 'registration';
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChargLab Demo App'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 50.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Registration',
                style: TextStyle(
                  fontSize: 35.0,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              SizedBox(
                height: 80.0,
              ),
              RaisedButton(
                child: Text('Submit', style: TextStyle(fontSize: 25.0)),
                onPressed: () async {
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      //Navigator.pushNamed(context, ChatScreen.id);
                      print('ok');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
