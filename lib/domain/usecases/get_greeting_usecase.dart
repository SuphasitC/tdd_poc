import 'package:tdd_poc/core/usecases.dart';
import 'package:tdd_poc/domain/entities/greeting_entity.dart';
import 'package:tdd_poc/domain/repositories/user_repository.dart';

class GetGreetingUseCase implements UseCase<GreetingEntity, NoRequestParams> {
  final UserRepository repository;

  GetGreetingUseCase(this.repository);

  @override
  Future<GreetingEntity> call(NoRequestParams params) async {
    return repository.getGreeting();
  }
}