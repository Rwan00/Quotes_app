import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qoutes/core/usecases/usecase.dart';
import 'package:qoutes/core/utils/app_consts.dart';
import 'package:qoutes/features/splash/domain/usecases/change_lang_usecase.dart';
import 'package:qoutes/features/splash/domain/usecases/get_saved_lang_usecase.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final GetSavedLangUsecase getSavedLangUsecase;
  final ChangeLangUseCase changeLangUseCase;
  LocaleCubit({
    required this.getSavedLangUsecase,
    required this.changeLangUseCase,
  }) : super(ChangeLocaleState(Locale(AppConsts.englishCode)));

  String currentLangCode = AppConsts.englishCode;

  Future<void> getSavedLang() async {
    final response = await getSavedLangUsecase.call(NoParams());
    response.fold((failure) => log(failure.toString()), (value) {
      currentLangCode = value;
      emit(ChangeLocaleState(Locale(currentLangCode)));
    });
  }

  Future<void> _changeLocale(String langCode) async {
    final response = await changeLangUseCase.call(langCode);
    response.fold((failure) => log(failure.toString()), (value) {
      currentLangCode = langCode;
      emit(ChangeLocaleState(Locale(currentLangCode)));
    });
  }

  void toEnglish() => _changeLocale(AppConsts.englishCode);
  void toArabic() => _changeLocale(AppConsts.arabicCode);
}
