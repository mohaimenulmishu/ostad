
import 'dart:convert';
import 'package:http/http.dart';
import 'package:task_manager_app/data/data.network_caller/network_response.dart';

class NetworkCaller{
Future postRequest(String url,{Map<String, dynamic>? body})async{
  try{
   final Response response= await post(Uri.parse(url),body: jsonEncode(body),headers: {
     "Content-type":"Application/json"
    });
   if (response.statusCode==200){
     return NetworkResponse(statusCode: 200, isSuccess:true, jsonResponse: jsonDecode(response.body));

   }
}catch(e){
    return NetworkResponse(isSuccess: false,errorMessage: e.toString() );
    
  }
  }
}
