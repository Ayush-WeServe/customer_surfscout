import '../utils/constants/keys.dart';

class UserModel {
  final String Name;
  final String PhoneNo;
  final String Email;
  final String Profile;

  UserModel(
    this.Name,
    this.PhoneNo,
    this.Email,
    this.Profile,
  );

  static UserModel empty() => UserModel('', '', '', '');
// Convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      Appkeys.userName: Name,
      Appkeys.phone: PhoneNo,
      Appkeys.email: Email,
      Appkeys.userProfile: Profile,
    };
  }

// Create UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json[Appkeys.userName],
      json[Appkeys.phone],
      json[Appkeys.email],
      json[Appkeys.userProfile],
    );
  }
}
