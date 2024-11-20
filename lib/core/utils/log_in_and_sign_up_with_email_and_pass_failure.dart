import '../constants/strings.dart';

class LogInAndSignUpWithEmailAndPassFailure implements Exception {
  const LogInAndSignUpWithEmailAndPassFailure([
    this.message = Strings.someThingWentWrong,
  ]);

  factory LogInAndSignUpWithEmailAndPassFailure.fromCode(String code) {
    switch (code) {
      /* case 'invalid-email':
        return const LogInAndSignUpWithEmailAndPassFailure(
          Strings.invalidEmail,
        ); */      
      default:
        return const LogInAndSignUpWithEmailAndPassFailure();
    }
  }

  final String message;
}
