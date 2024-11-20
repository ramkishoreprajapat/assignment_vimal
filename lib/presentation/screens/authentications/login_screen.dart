import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/strings.dart';
import '../../../core/enum/custom_scaffold_enum.dart';
import '../../../core/utils/no_space_input_formatter.dart';
import '../../../core/utils/utility.dart';
import '../../../logic/bloc/sign_in_bloc/sign_in_bloc.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/custom_text_field.dart';
import 'widgets/password_text_field.dart';

final _usernameController = TextEditingController();
final _passwordController = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {       
        if (state is SignInFailure) {
          isShowLoader(false);
          Utility().showSnackBar(state.message!);
        } else if (state is SignInSuccess) {
           isShowLoader(false);
          _usernameController.clear();
          _passwordController.clear();
        }
      },
      child: CustomScaffold(
        appBartitle: '',
        costomScaffoldEnum: CustomScaffoldEnum.scaffoldWithoutAppBarNSafeArea,
        safeAreaChild: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                'images/ic_login_top.jpg',
                width: double.maxFinite,
                height: 180,
                fit: BoxFit.cover,
              ),
              Container(
                margin: const EdgeInsets.only(top: 140),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: CircleAvatar(
                            radius: 40,
                            child: Image.asset(
                              'images/ic_logo.png',
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          Strings.connectWithUs,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomTextField(
                          controller: _usernameController,
                          hintText: Strings.username,
                          obscureText: false,
                          maxLength: 256,
                          textInputType: TextInputType.name,
                          textInputFormatter: [NoSpaceInputFormatter()],
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        PasswordTextField(
                            controller: _passwordController,
                            hintText: Strings.password,
                            textInputAction: TextInputAction.done),
                        
                        const SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                            title: Strings.signIn,
                            isLoading: isLoading,
                            onPressed: () => {_checkSignIn(context)}),
                        const SizedBox(
                          height: 40,
                        ),                        
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _checkSignIn(BuildContext context) {
    if (_usernameController.text.isEmpty) {
      Utility().showSnackBar(Strings.pleaseEnterUsername);
    } else if (_passwordController.text.isEmpty) {
      Utility().showSnackBar(Strings.pleaseEnterPassword);
    } else {    
      isShowLoader(true);
      context
          .read<SignInBloc>()
          .add(SignInRequired(_usernameController.text, _passwordController.text));
    }
  }

  void isShowLoader(bool isShowLoader) {
    setState(() {
      isLoading = isShowLoader;
    });
  }
}
