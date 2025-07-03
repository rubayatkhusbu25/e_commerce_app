part of 'network_client.dart';

class NetworkResponse{
  final int statusCode;
  final Map<String,dynamic>? responseBody;
  final String? errorMessage;
  final bool isSuccess;


  NetworkResponse( {required this.isSuccess,required this.statusCode, this.responseBody, this.errorMessage});
}