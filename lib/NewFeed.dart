import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class NewFeed extends StatefulWidget {
  final String uid;
  NewFeed({this.uid});
  
  @override
  State<StatefulWidget> createState() {
    return _NewFeedState();
  }
}

class _NewFeedState extends State<NewFeed> {

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