
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/login/bloc/login_bloc.dart';
import 'package:store/login/bloc/login_event.dart';
import 'package:store/login/model/login_req_model.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page"),) ,
      body: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: userNameController,
              decoration: InputDecoration(
                hintText: "username"
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: "password"
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              // BlocProvider.of<LoginBloc>(context).add(LoginReqEvent(loginReqModel: LoginReqModel(username: userNameController.text,password: passwordController.text)));
              var bloc = BlocProvider.of<LoginBloc>(context);
              var req = LoginReqModel(username: userNameController.text,password: passwordController.text);
              bloc.add(LoginReqEvent(loginReqModel: req));
            }, child: Text("Login"))
          ],
        ),
      )

    );
  }
}
