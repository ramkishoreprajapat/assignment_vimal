import 'models/main_response.dart';

abstract class UserRepository {
  Future<MainResponse> signIn(String username, String password);
}
