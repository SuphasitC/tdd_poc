import 'package:tdd_poc/api_service.dart';
import 'package:tdd_poc/dependency_injection.dart';

class RemoteDataSource {
  final ApiService apiService = sl<ApiService>();
}