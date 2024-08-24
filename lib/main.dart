import 'package:demoproject/pages/homepage.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Demo",
      debugShowCheckedModeBanner: false,
      home:HomePage(),

    );
  }
}