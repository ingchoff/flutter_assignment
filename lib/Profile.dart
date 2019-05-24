import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  final String uid;
  Profile({this.uid});
  
  @override
  State<StatefulWidget> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {

  String _txt;

  @override
  void initState() {
    if (_txt == null) {
      _read();
    }
    super.initState();
  }

  Future<String> _read() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _txt = prefs.getString('user');
    });
    return _txt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MainPage')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 100),
          child: Column(
            children: <Widget>[
              Text('Account Info: $_txt')
            ],
          ),
        )
        
      ),
    );
  }
}