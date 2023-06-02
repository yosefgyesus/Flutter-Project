import 'package:finalproject/domain/user/greeting/greeting.dart';
import 'package:finalproject/infrastructure/services/api_service.dart';

class GreetingService {
  final ApiService apiService;

  GreetingService(this.apiService);

  Future<List<Greeting>> getGreetings() async {
    try {
      final List<dynamic> greetingData = await apiService.fetchGreetings();
      final List<Greeting> greetings =
          greetingData.map((json) => Greeting.fromJson(json)).toList();
      return greetings;
    } catch (error) {
      throw Exception('Failed to retrieve greetings: $error');
    }
  }
}
