
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/login/bloc/login_bloc.dart';
import 'package:store/login/bloc/login_event.dart';
import 'package:store/login/bloc/login_state.dart';
import 'package:store/login/model/login_req_model.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page"),) ,
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (BuildContext context, state) {
          if(state is LoginInitialState){
            return Padding(padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: userNameController,
                    decoration: const InputDecoration(
                        hintText: "username"
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                        hintText: "password"
                    ),
                  ),
                  const SizedBox(height: 10,),
                  ElevatedButton(onPressed: (){
                    // BlocProvider.of<LoginBloc>(context).add(LoginReqEvent(loginReqModel: LoginReqModel(username: userNameController.text,password: passwordController.text)));
                    var bloc = BlocProvider.of<LoginBloc>(context);
                    var req = LoginReqModel(username: userNameController.text,password: passwordController.text);
                    bloc.add(LoginReqEvent(loginReqModel: req));
                  }, child: const Text("Login"))
                ],
              ),
            );
          } else if(state is LoginLoadingState){
            return const SizedBox(height: 100,
              child: Center(child: CircularProgressIndicator(),),
            );
          } else if(state is LoginLoadedState){
            return Center(child: Text(state.loginRespModel?.email??"NA",style: const TextStyle(color: Colors.blue),),);
          }else if(state is LoginErrorState){
            return Center(child: Text(state.errorMsg??"",style: const TextStyle(color: Colors.red),),);
          } else {
            return Container();
          }
        },
      )

    );
  }
}
