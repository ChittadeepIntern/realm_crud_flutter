import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:realm_poc/models/user_model.dart';
import 'package:realm_poc/services/realm_service.dart';

class ListAllUsersProvider extends ChangeNotifier {
  List<UserModel> userList = [];
  bool isLoading = false;

  fetchAllUsers() async {
    isLoading = true;
    userList.clear();
    userList = RealmService.instance.getAllUsers();
    notifyListeners();
    isLoading = false;
    notifyListeners();
  }

  deleteAnUser(String email) {
    RealmService.instance.delete(email);
    fetchAllUsers();
    notifyListeners();
  }
}
