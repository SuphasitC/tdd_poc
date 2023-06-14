import 'package:get_it/get_it.dart';
import 'package:tdd_poc/data/datasources/user_remote_datasource.dart';
import 'package:tdd_poc/data/repositories/user_repository_impl.dart';
import 'package:tdd_poc/domain/repositories/user_repository.dart';
import 'package:tdd_poc/domain/usecases/get_greeting_usecase.dart';
import 'package:tdd_poc/domain/usecases/get_user_usecase.dart';
import 'package:tdd_poc/presentation/screens/home_screen/home_screen_controller.dart';

final GetIt sl = GetIt.instance;

class DependencyInjection {
  static Future<void> setupLocator() async {
    // // Provider
    sl.registerFactory<HomeScreenController>(
      () => HomeScreenController(sl<GetUserUseCase>(), sl<GetGreetingUseCase>()),
    );

    // UseCases
    sl.registerFactory<GetUserUseCase>(
      () => GetUserUseCase(sl<UserRepository>()),
    );
    sl.registerFactory<GetGreetingUseCase>(
      () => GetGreetingUseCase(sl<UserRepository>()),
    );

    // Repository
    sl.registerFactory<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: sl<UserRemoteDataSource>()),
    );

    // Remote datasource
    sl.registerFactory<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(),
    );
  }
}
