class UserModel {
  int? success;
  Data? data;
  int? userId;
  String? role;
  String? message;
  String? username;

  UserModel(
      {this.success,
      this.data,
      this.userId,
      this.role,
      this.message,
      this.username});

  UserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    userId = json['user_id'];
    role = json['role'];
    message = json['message'];
    username = json['username'];
  }
}

class Data {
  String? refresh;
  String? access;
  int? userId;
  String? role;
  String? username;
  String? email;
  String? lastLogin;

  Data(
      {this.refresh,
      this.access,
      this.userId,
      this.role,
      this.username,
      this.email,
      this.lastLogin});

  Data.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
    userId = json['user_id'];
    role = json['role'];
    username = json['username'];
    email = json['email'];
    lastLogin = json['last_login'];
  }
}
