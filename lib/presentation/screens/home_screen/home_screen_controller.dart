import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tdd_poc/core/usecases.dart';
import 'package:tdd_poc/domain/entities/greeting_entity.dart';
import 'package:tdd_poc/domain/entities/user_entity.dart';
import 'package:tdd_poc/domain/usecases/get_greeting_usecase.dart';
import 'package:tdd_poc/domain/usecases/get_user_usecase.dart';

class HomeScreenController with ChangeNotifier {
  final GetUserUseCase _getUser;
  final GetGreetingUseCase _getGreeting;
  bool isLoading = false;
  UserEntity? user;
  GreetingEntity? greeting;

  HomeScreenController(this._getUser, this._getGreeting);

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

  Future<void> getGreeting() async {
    try {
      greeting = await _getGreeting(NoRequestParams());
      notifyListeners();
    } catch (e) {
      log(e.toString());
      notifyListeners();
    }
  }
}
