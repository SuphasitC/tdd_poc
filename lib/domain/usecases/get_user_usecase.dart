import 'package:tdd_poc/core/usecases.dart';
import 'package:tdd_poc/domain/entities/user_entity.dart';
import 'package:tdd_poc/domain/repositories/user_repository.dart';

class GetUserUseCase implements UseCase<UserEntity, GetUserRequestParams> {
  final UserRepository repository;
  GetUserUseCase(this.repository);

  @override
  Future<UserEntity> call(GetUserRequestParams params) async {
    return repository.getUser(params.id, params.password);
  }
}

class GetUserRequestParams {
  final String id;
  final String password;

  GetUserRequestParams({required this.id, required this.password});
}
