class PsychoModel {
  final String uuid;
  final String name;
  final String imageUrl;
  final String rating;
  final DateTime createdAt;
  final String speciality;

  PsychoModel({
    required this.uuid,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.createdAt,
    required this.speciality,
  });

  factory PsychoModel.fromJson(Map<String, dynamic> json) {
    return PsychoModel(
      uuid: json['uuid'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      rating: json['rating'],
      createdAt: DateTime.parse(json['createdAt']),
      speciality: json['speciality'],
    );
  }
}


class UpcomingSessionModel {
  final String uuid;
  final String name;
  final String imageUrl;
  final DateTime createdAt;
  final DateTime sessionStartDate;
  final DateTime sessionEndDate;
  final String duration;
  final bool isCompleted;
  final bool isCancelled;
  final String psychoId;

  UpcomingSessionModel({
    required this.uuid,
    required this.name,
    required this.imageUrl,
    required this.createdAt,
    required this.sessionStartDate,
    required this.sessionEndDate,
    required this.duration,
    required this.isCompleted,
    required this.isCancelled,
    required this.psychoId,
  });

  factory UpcomingSessionModel.fromJson(Map<String, dynamic> json) {
    return UpcomingSessionModel(
      uuid: json['uuid'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      createdAt: DateTime.parse(json['createdAt']),
      sessionStartDate: DateTime.parse(json['sessionStartDate']),
      sessionEndDate: DateTime.parse(json['sessionEndDate']),
      duration: json['duration'],
      isCompleted: json['isCompleted'],
      isCancelled: json['isCancelled'],
      psychoId: json['psychoId'],
    );
  }
  
}

class TopResourceModel {
  final String uuid;
  final String name;

  TopResourceModel({
    required this.uuid,
    required this.name,
  });

  factory TopResourceModel.fromJson(Map<String, dynamic> json) {
    return TopResourceModel(
      uuid: json['uuid'],
      name: json['name'],
    );
  }
  
}

class BookPsycho {
  final String userId;
  final String psychoId;
  final String sessionStartDate;
  final String sessionEndDate;
  final String duration;
  final DateTime createdAt;

  BookPsycho({
    required this.userId,
    required this.psychoId,
    required this.sessionStartDate,
    required this.sessionEndDate,
    required this.duration,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'psychoId': psychoId,
      'sessionStartDate': sessionStartDate,
      'sessionEndDate': sessionEndDate,
      'duration': duration,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory BookPsycho.fromJson(Map<String, dynamic> json) {
    return BookPsycho(
      userId: json['userId'],
      psychoId: json['psychoId'],
      sessionStartDate: json['sessionStartDate'],
      sessionEndDate: json['sessionEndDate'],
      duration: json['duration'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}