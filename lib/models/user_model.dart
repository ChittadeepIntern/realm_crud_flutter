import 'package:realm_poc/models/gender.dart';

class UserModel {
  String? name;
  String? countryCode;
  String? phoneNumber;
  Gender? gender;
  DateTime? birthdate;

  UserModel(this.name, this.countryCode, this.phoneNumber, this.gender, this.birthdate);

  @override
  String toString() {
    return '''New user created
    name $name, country code $countryCode, phone number $phoneNumber, 
    gender $gender, birthdate $birthdate''';
  }
}
