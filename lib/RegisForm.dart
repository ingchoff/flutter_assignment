import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  final _formkey = GlobalKey<FormState>();
  final textValue1 = TextEditingController();
  final textValue2 = TextEditingController();
  final textValue3 = TextEditingController();

   @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    // This also removes the _printLatestValue listener
    textValue1.dispose();
    textValue2.dispose();
    textValue3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
      ),
      key: _formkey,
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: TextFormField(
              controller: textValue1,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'email',
                prefixIcon: Icon(Icons.email)
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: TextFormField(
              controller: textValue2,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'password',
                prefixIcon: Icon(Icons.https)
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
            child: TextFormField(
              controller: textValue3,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'comfirm password',
                prefixIcon: Icon(Icons.https)
              ),
            ),
          ),
          SizedBox(
            height: 70,
            child: RaisedButton(
              color: Colors.blue,
              child: Text('CONTINUE',style: TextStyle(color: Colors.white),),
              onPressed: () {
                if(textValue1.text.isEmpty||textValue2.text.isEmpty||textValue3.text.isEmpty){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        // title: new Text("AlertDialog Class"),
                        content: new Text("กรุณาระบุข้อมูลให้ครบถ้วน"),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text("Ok"),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                      );
                    }
                  );
                
              } else if(textValue1.text=='admin'&&textValue2.text.isNotEmpty&&textValue3.text.isNotEmpty){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      // title: new Text("AlertDialog Class"),
                      content: new Text("user นี้มีอยู่ใน ระบบแล้ว"),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text("Ok"),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  )
                ],
                    );
                  }
                );
              } else{
                Navigator.pop(context);
              }
            },
          )
          )
        ],
      ),
    );
}
}