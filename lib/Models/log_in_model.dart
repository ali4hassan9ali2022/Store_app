class LogInModel {
  final bool status;
  final String message;
  final UserData? userData;

  LogInModel({
    required this.status,
    required this.message,
    required this.userData,
  });
  factory LogInModel.fromJson(jsonData) {
    return LogInModel(
      status: jsonData['status'],
      message: jsonData['message'],
      userData: jsonData['data'] != null ? UserData.fromJson(jsonData['data']) : null,
    );
  }
}

class UserData {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? image;
  final int? points;
  final int? credit;
  final String? token;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });
  factory UserData.fromJson(json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      points: json['points'],
      credit: json['credit'],
      token: json['token'],
    );
  }
}

//  email = json['email'];
//     phone = json['phone'];
//     image = json['image'];
//     points = json['points'];
//     credit = json['credit'];
//     token = json['token'];
