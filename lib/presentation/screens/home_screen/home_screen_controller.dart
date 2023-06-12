import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tdd_poc/domain/entities/user_entity.dart';
import 'package:tdd_poc/domain/usecases/get_user_usecase.dart';

class HomeScreenController with ChangeNotifier {
  final GetUserUseCase _getUser;
  bool isLoading = false;
  UserEntity? user;

  HomeScreenController(this._getUser);

  Future<void> getUserByIdAndPassword(String id, String password) async {
    try {
      isLoading = true;
      notifyListeners();
      user = await _getUser(GetUserRequestParams(id: id, password: password));
      isLoading = false;
      notifyListeners();
    } catch (e) {
      log(e.toString());
      isLoading = false;
      notifyListeners();
    }
  }
}
