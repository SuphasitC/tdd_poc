import 'package:tdd_poc/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  Future<UserModel> getUser(String id, String password);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  UserRemoteDataSourceImpl();

  @override
  Future<UserModel> getUser(String id, String password) async {
    var requestBody = {"id": id, "password": password};

    // call api (POST)
    // final response = await http.post(url, body: requestBody);

    // call api (GET)
    // final response = await http.get(url);

    // mock response
    await Future.delayed(const Duration(seconds: 2));
    final response = {
      "code": 1000,
      "data": {
        "id": "1234567890",
        "firstName": "GLO",
        "lastName": "Lotto",
        "age": 22
      }
    };

    // or something about http handling
    if (response['data'] != null) {
      return UserModel.fromJson(response['data'] as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load service');
    }
  }
}
