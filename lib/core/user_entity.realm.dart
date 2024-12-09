// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../entities/user_entity.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class UserEntity extends _UserEntity
    with RealmEntity, RealmObjectBase, RealmObject {
  UserEntity(
    String email, {
    String? name,
    String? countryCode,
    String? phoneNumber,
    String? gender,
    DateTime? birthdate,
  }) {
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'countryCode', countryCode);
    RealmObjectBase.set(this, 'phoneNumber', phoneNumber);
    RealmObjectBase.set(this, 'email', email);
    RealmObjectBase.set(this, 'gender', gender);
    RealmObjectBase.set(this, 'birthdate', birthdate);
  }

  UserEntity._();

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  String? get countryCode =>
      RealmObjectBase.get<String>(this, 'countryCode') as String?;
  @override
  set countryCode(String? value) =>
      RealmObjectBase.set(this, 'countryCode', value);

  @override
  String? get phoneNumber =>
      RealmObjectBase.get<String>(this, 'phoneNumber') as String?;
  @override
  set phoneNumber(String? value) =>
      RealmObjectBase.set(this, 'phoneNumber', value);

  @override
  String get email => RealmObjectBase.get<String>(this, 'email') as String;
  @override
  set email(String value) => RealmObjectBase.set(this, 'email', value);

  @override
  String? get gender => RealmObjectBase.get<String>(this, 'gender') as String?;
  @override
  set gender(String? value) => RealmObjectBase.set(this, 'gender', value);

  @override
  DateTime? get birthdate =>
      RealmObjectBase.get<DateTime>(this, 'birthdate') as DateTime?;
  @override
  set birthdate(DateTime? value) =>
      RealmObjectBase.set(this, 'birthdate', value);

  @override
  Stream<RealmObjectChanges<UserEntity>> get changes =>
      RealmObjectBase.getChanges<UserEntity>(this);

  @override
  Stream<RealmObjectChanges<UserEntity>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<UserEntity>(this, keyPaths);

  @override
  UserEntity freeze() => RealmObjectBase.freezeObject<UserEntity>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'name': name.toEJson(),
      'countryCode': countryCode.toEJson(),
      'phoneNumber': phoneNumber.toEJson(),
      'email': email.toEJson(),
      'gender': gender.toEJson(),
      'birthdate': birthdate.toEJson(),
    };
  }

  static EJsonValue _toEJson(UserEntity value) => value.toEJson();
  static UserEntity _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'email': EJsonValue email,
      } =>
        UserEntity(
          fromEJson(email),
          name: fromEJson(ejson['name']),
          countryCode: fromEJson(ejson['countryCode']),
          phoneNumber: fromEJson(ejson['phoneNumber']),
          gender: fromEJson(ejson['gender']),
          birthdate: fromEJson(ejson['birthdate']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(UserEntity._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, UserEntity, 'UserEntity', [
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('countryCode', RealmPropertyType.string, optional: true),
      SchemaProperty('phoneNumber', RealmPropertyType.string, optional: true),
      SchemaProperty('email', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('gender', RealmPropertyType.string, optional: true),
      SchemaProperty('birthdate', RealmPropertyType.timestamp, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
