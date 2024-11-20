import 'dart:developer';
import 'package:user_repository/src/models/error_model.dart';
import 'package:user_repository/src/models/main_response.dart';
import 'package:user_repository/src/user_repo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AuthUserRepo implements UserRepository {
  
  @override
  Future<MainResponse> signIn(String username, String password) async {
    try {
      var mainResponse = MainResponse.empty;
      var url = Uri.parse(
          'https://dev.payyap.ch:8443/realms/dev-realm/protocol/openid-connect/token');

      // Form-encoded body
      final body = {
        'client_id': 'php-app',
        'grant_type': 'password',
        'username': username,
        'password': password,
      };

      var response = await http.post(url, body: body);
      if (response.statusCode == 200) {
        return mainResponse.copyWith(
            statusCode: response.statusCode,
            succcessData:
                convert.jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        return mainResponse.copyWith(
            statusCode: response.statusCode,
            errorData: ErrorModel.fromJson(
                convert.jsonDecode(response.body) as Map<String, dynamic>));
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

}
