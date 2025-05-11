
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/login/bloc/login_bloc.dart';
import 'package:store/login/login_page.dart';

void main(){
  runApp(MyStore());
}

class MyStore extends StatelessWidget {
  const MyStore({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> LoginBloc())
      ],
      child: MaterialApp(
        title: 'Login Bloc',
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
  
}