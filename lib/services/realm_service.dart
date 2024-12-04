import 'dart:developer';

import 'package:realm/realm.dart';
import 'package:realm_poc/entities/user_entity.dart';
import 'package:realm_poc/models/user_model.dart';

class RealmService {
  late Realm realm;

  static RealmService instance = RealmService();

  RealmService() {
    final config = Configuration.local([UserEntity.schema]);
    realm = Realm(config);
  }

  void write(UserModel userModel) {
    log("adding an user to realm");
    log("the value of gender is ${userModel.gender!.name}");

    realm.write(() {
      realm.add(UserEntity(userModel.email,
          name: userModel.name,
          birthdate: userModel.birthdate,
          countryCode: userModel.countryCode,
          gender: userModel.gender!.name,
          phoneNumber: userModel.phoneNumber));
    });
  }

  List<UserModel> getAllUsers() => realm
      .all<UserEntity>()
      .map((entity) => UserModel.fromEntity(entity))
      .toList();

  getUsersByEmail(String email) => realm.query<UserEntity>('email = $email');
}
