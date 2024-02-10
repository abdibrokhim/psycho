// import 'package:flutter/foundation.dart';
import 'package:psycho/screens/auth/components/secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:psycho/screens/psycho/psycho_model.dart';


class PsychoService {

 
  // TODO: Implement this method
  static Future<List<PsychoModel>> fetchPsychos() async {
    print('Fetching psychos');
    try {
      return Future.error('');
     
    } catch (e) {
      print("");
      return Future.error('');
    }
  }



  // TODO: Implement this method
  static Future<List<UpcomingSessionModel>> fetchSessions() async {
    print('');
    try {
      return Future.error('');

    } catch (e) {
        print("");
        return Future.error('');
    }
  }



  // TODO: Implement this method
  static Future<List<TopResourceModel>> fetchResources() async {
    print('Fetching psychos');
    try {
      return Future.error('');

    } catch (e) {
        print("");
        return Future.error('');
    }
  }


}

