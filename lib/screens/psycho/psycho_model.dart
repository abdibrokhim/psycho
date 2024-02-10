class PsychoModel {
  final String uuid;
  final String name;

  PsychoModel({
    required this.uuid,
    required this.name,
  });

  factory PsychoModel.fromJson(Map<String, dynamic> json) {
    return PsychoModel(
      uuid: json['uuid'],
      name: json['name'],
    );
  }
  
}


class UpcomingSessionModel {
  final String uuid;
  final String name;

  UpcomingSessionModel({
    required this.uuid,
    required this.name,
  });

  factory UpcomingSessionModel.fromJson(Map<String, dynamic> json) {
    return UpcomingSessionModel(
      uuid: json['uuid'],
      name: json['name'],
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