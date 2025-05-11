import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/login/bloc/login_event.dart';
import 'package:store/login/bloc/login_state.dart';
import 'package:store/login/repo/login_repo.dart';

import '../model/login_resp_model.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  LoginBloc(): super(LoginInitialState()){ //initial State
    on<LoginReqEvent>((event, emit) async{//initial event
      emit(LoginLoadingState());
      try {
        LoginRespModel respModel = await LoginRepo().login(event.loginReqModel?.username??"", event.loginReqModel?.password??"");
        emit(LoginLoadedState(loginRespModel: respModel));
      } catch (e){
        emit(LoginErrorState(errorMsg: e.toString()));
      }
    });
  }

}