


import 'package:dio/dio.dart';

import '../models/user_model.dart';

class AuthRepository {
  final Dio dio = Dio();


  Future<Map<String, dynamic>?> login(String email, String password) async {
    try {
      final response = await dio.post(
        'http://192.168.1.162:3000/api/v1/users/login',
        data: {'email': email, 'password': password},
      );
      // Print response data for debugging
      print('Response data: ${response.data}');
      if (response.statusCode == 200 && response.data != null) {
        return{
          'user': User.fromJson(response.data['user']),// Assuming the backend returns user data
          'token': response.data['token'] // Token data
        };
      }
    } catch (e) {
      print('Login error: $e');
    }
    return null;
  }

}