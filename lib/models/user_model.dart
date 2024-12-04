import 'package:realm_poc/entities/user_entity.dart';
import 'package:realm_poc/models/gender.dart';

class UserModel {
  String? name;
  String? countryCode;
  String? phoneNumber;
  late String email;
  Gender? gender;
  DateTime? birthdate;

  UserModel(this.name, this.countryCode, this.phoneNumber, this.email,
      this.gender, this.birthdate);

  UserModel.fromEntity(UserEntity userEntity) {
    email = userEntity.email;
    name = userEntity.name;
    countryCode = userEntity.countryCode;
    phoneNumber = userEntity.phoneNumber;
    gender = Gender.values.byName(userEntity.gender ?? 'Male');
    birthdate = userEntity.birthdate;
  }

  @override
  String toString() {
    return '''
    name $name, country code $countryCode, phone number $phoneNumber, email $email,
    gender $gender, birthdate $birthdate''';
  }
}
