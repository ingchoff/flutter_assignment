import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
	@override
	LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
	final _formKey = GlobalKey<FormState>();
  final textValue1 = TextEditingController();
  final textValue2 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    // This also removes the _printLatestValue listener
    textValue1.dispose();
    textValue2.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.center,
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Image.asset('resources/img.jpg',height: 250,),
          ),  
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: TextFormField(
              controller: textValue1,
              decoration: InputDecoration(
                labelText: 'User ID',
                prefixIcon: Icon(Icons.person)
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: TextFormField(
              controller: textValue2,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.https)
              ),
              obscureText: true,
              ),
          ),   
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: RaisedButton(
              onPressed: (){
                if(textValue1.text.isEmpty||textValue2.text.isEmpty){
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('กรุณา ระบุ user or password')));
                } else if(textValue1.text == 'admin'&&textValue2.text == 'admin'){
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('user or password ไม่ถูกต้อง')));
                } else{
                  Navigator.pushNamed(context, '/main');
                }
              },
              child: Text('LOGIN'),
            ),
          ),
          FlatButton(
            onPressed: (){
              Navigator.pushNamed(context, '/regis');
              },
            child: Text('Register New Account',style: TextStyle(color: Colors.teal),textAlign: TextAlign.right,),
          )
        ]
      )
    );
  }
}