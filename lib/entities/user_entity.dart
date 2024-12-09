import 'package:realm/realm.dart';  // import realm package
 part '../core/user_entity.realm.dart';

@RealmModel()
class _UserEntity {
  late String? name;
  late String? countryCode;
  late String? phoneNumber;

  @PrimaryKey()
  late String email;

  late String? gender;
  late DateTime? birthdate;
}