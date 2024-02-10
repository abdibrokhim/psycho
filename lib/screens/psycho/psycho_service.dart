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
      var sampleData = [
        {
          "uuid": "1",
          "name": "Dr. Alice Smith",
          "imageUrl": "https://cdn4.iconfinder.com/data/icons/glyphs/24/icons_user-128.png",
          "rating": "4.8",
          "createdAt": "2023-05-15T12:00:00Z",
          "speciality": "Clinical Psychology"
        },
        {
          "uuid": "2",
          "name": "Dr. John Doe",
          "imageUrl": "https://cdn4.iconfinder.com/data/icons/glyphs/24/icons_user-128.png",
          "rating": "4.5",
          "createdAt": "2022-10-20T09:30:00Z",
          "speciality": "Cognitive Behavioral Therapy"
        },
        {
          "uuid": "3",
          "name": "Dr. Emily Johnson",
          "imageUrl": "https://cdn4.iconfinder.com/data/icons/glyphs/24/icons_user-128.png",
          "rating": "4.9",
          "createdAt": "2024-01-05T15:45:00Z",
          "speciality": "Child Psychology"
        }

      ];
      return Future.value(sampleData.map((e) => PsychoModel.fromJson(e)).toList());
     
    } catch (e) {
      print("");
      return Future.error('');
    }
  }



  // TODO: Implement this method
  static Future<List<UpcomingSessionModel>> fetchSessions() async {
    print('Fetching fetchSessions');
    try {

      var sampleData = [
  {
    "uuid": "1",
    "name": "Therapy Session 1",
    "imageUrl": "https://picsum.photos/1016/759",
    "createdAt": "2023-05-15T12:00:00Z",
    "sessionStartDate": "2023-06-01T10:00:00Z",
    "sessionEndDate": "2023-06-01T11:00:00Z",
    "duration": "1 hour",
    "isCompleted": false,
    "isCancelled": false,
    "psychoId": "1"
  },
  {
    "uuid": "2",
    "name": "Therapy Session 2",
    "imageUrl": "https://picsum.photos/1016/759",
    "createdAt": "2022-10-20T09:30:00Z",
    "sessionStartDate": "2022-11-05T14:30:00Z",
    "sessionEndDate": "2022-11-05T15:30:00Z",
    "duration": "1 hour",
    "isCompleted": false,
    "isCancelled": false,
    "psychoId": "2"
  },
  {
    "uuid": "3",
    "name": "Therapy Session 3",
    "imageUrl": "https://picsum.photos/1016/759",
    "createdAt": "2024-01-05T15:45:00Z",
    "sessionStartDate": "2024-01-20T11:00:00Z",
    "sessionEndDate": "2024-01-20T12:00:00Z",
    "duration": "1 hour",
    "isCompleted": false,
    "isCancelled": false,
    "psychoId": "3"
  }
];

      return Future.value(sampleData.map((e) => UpcomingSessionModel.fromJson(e)).toList());

    } catch (e) {
        print("");
        return Future.error('');
    }
  }



  // TODO: Implement this method
  static Future<List<TopResourceModel>> fetchResources() async {
    print('Fetching fetchResources');
    try {
      return Future.error('');

    } catch (e) {
        print("");
        return Future.error('');
    }
  }


}

