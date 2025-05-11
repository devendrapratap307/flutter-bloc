import 'package:equatable/equatable.dart';
import 'package:store/login/model/login_req_model.dart';

abstract class LoginEvent extends Equatable{

}

class LoginReqEvent extends LoginEvent {
  LoginReqModel? loginReqModel;
  LoginReqEvent({this.loginReqModel});

  @override
  List<Object?> get props => [loginReqModel];
}