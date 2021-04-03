import 'dart:convert';
import 'dart:io';


import 'package:http/http.dart' as http;
import 'package:mobileiot_service_tool/Network/ApiResponse.dart';
import 'package:mobileiot_service_tool/Network/AppException.dart';
import 'package:mobileiot_service_tool/Utility/MyConstants.dart';



class ApiBase {

   ApiBase({this.url});

   String url;
  Future<dynamic> get(mastertag) async {
  
    try {
     final http.Response response =
          await http.get(Base_server_URL_Test + Sub_Url + mastertag + Heatertag, headers: <String, String>{
        'Ocp-Apim-Subscription-Key': OcpHuddigSubscriptionKey,
        'Content-Type': 'application/json'
      });
      print(Base_server_URL_Test + Sub_Url + mastertag + Heatertag);
      print(response.statusCode);
      print(response.body);
      var responseJson = _proceesRequest(response);
      return responseJson;
    } on SocketException {
      FetchDataException('No Internet connections');
    } catch (error) {
      ApiResponse<dynamic>.error(error.toString());
    }
  }

  dynamic _proceesRequest(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

}