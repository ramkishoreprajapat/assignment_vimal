import 'package:assignment_vimal/logic/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_repository/product_repository.dart';
import 'package:user_repository/user_repository.dart';
import 'logic/bloc/product_bloc/product_bloc.dart';
import 'my_app_view.dart';
import 'presentation/router/app_router.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final UserRepository userRepository;
  final OurProductRepo productRepository;
  const MyApp(
      {super.key, required this.appRouter, required this.userRepository, required this.productRepository});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SignInBloc>(
          create: (context) => SignInBloc(userRepository),
        ),
        RepositoryProvider(
          create: (context) => ProductBloc(productRepository),
        ),
      ],
      child: MyAppView(
        appRouter: appRouter,
      ),
    );
  }
}
