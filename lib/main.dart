import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:product_repository/product_repository.dart';
import 'package:user_repository/user_repository.dart';
import 'core/utils/shared_preference_singleton.dart';
import 'my_app.dart';
import 'presentation/router/app_router.dart';
import 'simple_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceSingleton().initialize();

  Bloc.observer = SimpleBlocObserver();

  runApp(MyApp(
    appRouter: AppRouter(),
    userRepository: AuthUserRepo(),
    productRepository: OurProductRepo(),
  ));
}
