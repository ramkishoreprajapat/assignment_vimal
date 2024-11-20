import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/strings.dart';
import 'core/utils/navigation_service.dart';
import 'core/utils/shared_preference_singleton.dart';
import 'logic/bloc/product_bloc/product_bloc.dart';
import 'logic/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'logic/cubit/theme_cubit.dart';
import 'presentation/router/app_router.dart';
import 'presentation/screens/authentications/login_screen.dart';
import 'presentation/screens/product/product_screen.dart';

class MyAppView extends StatefulWidget {
  final AppRouter appRouter;
  const MyAppView({
    super.key,
    required this.appRouter,
  });

  @override
  State<MyAppView> createState() => _MyAppViewState();
}

class _MyAppViewState extends State<MyAppView> {
  bool isDarkTheme = false;

  @override
  void initState() {
    super.initState();
    isDarkTheme = SharedPreferenceSingleton()
        .getBool(SharedPreferenceSingleton.isDarkTheme);
  } 

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              SignInBloc(context.read<SignInBloc>().userRepository),
        ),
        BlocProvider(
          create: (context) =>
              ProductBloc(context.read<ProductBloc>().productRepository),
        ),
        BlocProvider(
          create: (_) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            navigatorKey: NavigationService.navigatorKey,
            title: Strings.appName,
            theme: themeMode == ThemeMode.dark
                ? ThemeData.dark()
                : ThemeData.light(),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: widget.appRouter.onGenerateRoutes,
            home: BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInSuccess) {
                  return const ProductScreen();
                } else {
                  return const LoginScreen();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
