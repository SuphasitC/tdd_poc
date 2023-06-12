import 'dart:developer';

import 'package:tdd_poc/data/datasources/user_remote_datasource.dart';
import 'package:tdd_poc/domain/entities/user_entity.dart';
import 'package:tdd_poc/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserEntity> getUser(String id, String password) async {
    try {
      return await remoteDataSource.getUser(id, password);
    } catch (e) {
      log(e.toString());
      throw Exception("Failed to load service");
    }
  }
}
