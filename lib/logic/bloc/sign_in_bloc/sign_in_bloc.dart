import 'package:assignment_vimal/core/utils/shared_preference_singleton.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository userRepository;

  SignInBloc(this.userRepository) : super(SignInInitial()) {
    on<SignInRequired>((event, emit) async {
      emit(SignInProcess());
      try {
        var response =
            await userRepository.signIn(event.username, event.password);
        if (response.statusCode == 200) {
          SharedPreferenceSingleton().setString(
              SharedPreferenceSingleton.accessToken,
              User.fromJson(response.succcessData).accessToken);
          emit(SignInSuccess());
        } else {
          emit(SignInFailure(message: response.errorData.errorDescription));
        }
      } catch (e) {
        emit(SignInFailure(message: e.toString()));
      }
    });
  }
}
