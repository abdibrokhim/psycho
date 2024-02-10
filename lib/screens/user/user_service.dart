// import 'package:flutter/foundation.dart';
import 'package:psycho/screens/auth/components/secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:psycho/screens/psycho/psycho_model.dart';


class UserService {

 
  // TODO: Implement this method
  static Future<List<int>> fetchShopsWithDebts(String userId) async {
    print('Fetching shops with debts for user $userId');
    try {
      return Future.error('');
     
    } catch (e) {
      print("");
      return Future.error('');
    }
  }

  // TODO: Implement this method
  static Future<List<int>> fetchDebtDetailsForShop(String userId, String shopId) async {
    print('Fetching debt details for shop $shopId for user $userId');
    try {
      return Future.error('');

    } catch (e) {
        print("");
        return Future.error('');
    }
}



}
