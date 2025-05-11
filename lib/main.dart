
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/login/login_page.dart';

void main(){
  runApp(MyStore());
}

class MyStore extends StatelessWidget {
  const MyStore({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
  
}