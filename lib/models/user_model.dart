import '../utils/constants/keys.dart';

class UserModel {
  final String Name;
  final String PhoneNo;
  final String Email;

  UserModel(
    this.Name,
    this.PhoneNo,
    this.Email,
  );

  static UserModel empty() => UserModel('', '', '');
// Convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      Appkeys.userName: Name,
      Appkeys.phone: PhoneNo,
      Appkeys.email: Email,
    };
  }

// Create UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json[Appkeys.userName],
      json[Appkeys.phone],
      json[Appkeys.email],
    );
  }
}
