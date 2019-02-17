import 'package:flutter/material.dart';
import 'package:flutter_assignment/LoginForm.dart';
import 'package:flutter_assignment/MainPage.dart';
import 'package:flutter_assignment/RegisForm.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Login';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text(appTitle),
        // ),
        body: LoginForm(),
      ),
      // initialRoute: '/',
      routes: {
        '/regis': (context) => RegisterForm(),
        '/main': (context) => MainPage()
      },
    );
  }
}
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   final routes = <String, WidgetBuilder>{
//     LoginPage.tag: (context) => LoginForm(),
//     // HomePage.tag: (context) => HomePage(),
//   };

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Kodeversitas',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.lightBlue,
//         fontFamily: 'Nunito',
//       ),
//       home: LoginForm(),
//       routes: routes,
//     );
//   }
// }