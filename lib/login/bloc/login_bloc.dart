import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/login/bloc/login_event.dart';
import 'package:store/login/bloc/login_state.dart';
import 'package:store/login/model/error_model.dart';
import 'package:store/login/repo/login_repo.dart';

import '../model/login_resp_model.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  LoginBloc(): super(LoginInitialState()){ //initial State
    on<LoginReqEvent>((event, emit) async{
      emit(LoginLoadingState());
      try {
        var respModel = await LoginRepo().login(event.loginReqModel?.username??"", event.loginReqModel?.password??"");
        if(respModel is LoginRespModel){
          emit(LoginLoadedState(loginRespModel: respModel));
        } else if (respModel is ErrorRespModel){
          emit(LoginErrorState(errorMsg: respModel.message?.toString()));
        }
      } catch (e){
        emit(LoginErrorState(errorMsg: e.toString()));
      }
    });
  }

}