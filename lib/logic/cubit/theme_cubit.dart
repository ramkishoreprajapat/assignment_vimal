import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/utils/shared_preference_singleton.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  void toggleTheme() {
    bool isDarkTheme = SharedPreferenceSingleton().getBool(SharedPreferenceSingleton.isDarkTheme);
    SharedPreferenceSingleton().setBool(SharedPreferenceSingleton.isDarkTheme, !isDarkTheme);
    emit(isDarkTheme ? ThemeMode.light : ThemeMode.dark);
    
  }
}