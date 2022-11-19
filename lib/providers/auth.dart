import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _usedId;


  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    try {
      var url = Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyCAR3wRXGiLJ2V67n_HVwF0JhGI5C6MXhk');
      final response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnedSecureToken': true
          }));
      final responseData = json.decode(response.body);
      if(responseData ['error']!= null ){
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> sigup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
