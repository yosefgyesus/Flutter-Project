import 'package:finalproject/domain/user/greeting/greeting.dart';
import 'package:finalproject/infrastructure/services/api_service.dart';

class GreetingRepository {
  final ApiService apiService;

  GreetingRepository(this.apiService);

  Future<List<Greeting>> fetchGreetings() async {
    try {
      final greetings = await apiService.fetchGreetings();
      return greetings.cast<Greeting>();
    } catch (e) {
      throw Exception('Failed to fetch greetings');
    }
  }
}
