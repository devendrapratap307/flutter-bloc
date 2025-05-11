import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store/login/model/error_model.dart';
import 'package:store/login/model/login_req_model.dart';
import 'package:store/login/model/login_resp_model.dart';
class LoginRepo {
  Future<Object> login(String username, String password) async{ // Object ===> LoginRespModel or ErrorRespModel
    String url ='https://dummyjson.com/user/login';
    LoginReqModel loginReqModel = LoginReqModel(username:username, password:password);
    http.Response response = await http.post(Uri.parse(url),
        headers: { 'Content-Type': 'application/json' },
        body: jsonEncode(loginReqModel.toJson()));
    try{
      var resp = response.body;
      var respBody = jsonDecode(resp);
      if(response.statusCode==200){
        return LoginRespModel.fromJson(respBody);
      } else {
        return ErrorRespModel.fromJson(respBody);
      }
    } catch(e){
      throw Exception(e);
    }
  }
}