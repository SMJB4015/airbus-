import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:airbus_app/constantes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
class AuthRepo {
  login(String email,String password) async {
    Uri url= Uri.parse(uurl+'user/login/'+email+'/'+password);

    var res= await http.get(url,
      headers: {});
  final data= json.decode(res.body);

  return data ;


  }
  login2(String email) async {
    Uri url= Uri.parse(uurl+'user/find/'+email);

    var res= await http.get(url,
        headers: {});
    final data= json.decode(res.body);
     User c=User(userName:data['userName'],role:data['role'],email:data['email'],id: data['id']);
        print(c.email);
    return c ;


  }
  register(String email,String password,String name,bool role) async {
    Uri url= Uri.parse(uurl+'user/save');
    var res= await http.post(url,
        headers: {'Content-Type':'application/json'},
        body: jsonEncode({"email":email,"role":role,"userName":name,"password":password}));
    final data= json.decode(res.body);
    print(data['email']);
    if(data['email']!=''){
      return data;

    }else{
      return data['error'];
    }


  }
  update(String email,String password,String infos_liv,String name) async {
    var pref= await SharedPreferences.getInstance();
    Uri url= Uri.parse(uurl+'/User/Add');
    String? token=pref.getString('token');
    var res= await http.put(url,
        headers: {'Content-Type':'application/json'},
        body: json.encode({"email":email,"infos_liv":infos_liv,"name":name,"password":password}));
    final data= json.decode(res.body);
    if(data['token']!=''){
      return data;

    }else{
      return data['detail'];
    }


  }

}