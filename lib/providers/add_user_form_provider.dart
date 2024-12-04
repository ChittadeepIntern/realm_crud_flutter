import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realm_poc/models/gender.dart';
import 'package:realm_poc/models/user_model.dart';

import 'package:realm/realm.dart';
import 'package:realm_poc/services/realm_service.dart';

class AddUserFormProvider extends ChangeNotifier {
  String _countryCode = "91";
  late String _name;
  late String _email;
  late String _phoneNumber;
  DateTime? _pickedDate;
  String? _showDate;

  late DateTime _birthdate;
  File? _imageFile;
  Gender _gender = Gender.MALE;

  String get countryCode => _countryCode;
  DateTime? get pickedDate => _pickedDate;
  String? get showDate => _showDate;
  File? get imageFile => _imageFile;
  Gender get gender => _gender;
  String get name => _name;
  String get email => _email;
  String get phoneNumber => _phoneNumber;
  DateTime get birthdate => _birthdate;

  set countryCode(String value) {
    _countryCode = value;
    notifyListeners();
  }

  void selectDate(BuildContext context) async {
    log("Date picker called");
    _pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      // Format the picked date and update the provider's state
      String formattedDate = "${pickedDate!.toLocal()}".split(' ')[0];
      _showDate = formattedDate; // Update the text field as well
      log("formatted date is $formattedDate");

      _birthdate = pickedDate!;
      notifyListeners();
    }
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
    }
    notifyListeners();
  }

  set gender(Gender gender) {
    _gender = gender;
    notifyListeners();
  }

  set name(String name) {
    _name = name;
  }

  set phoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
  }

  set email(String email) {
    _email = email;
  }

  void saveData() {
    var user =
        UserModel(name, countryCode, phoneNumber, email, gender, birthdate);
    try {
      RealmService.instance.write(user);
      
    } catch (e) {
      log(e.toString());
    }
  }
}
