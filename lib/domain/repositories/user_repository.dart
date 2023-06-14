import 'package:tdd_poc/domain/entities/greeting_entity.dart';
import 'package:tdd_poc/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> getUser(String id, String password);
  Future<GreetingEntity> getGreeting();
}
