part of 'locale_cubit.dart';

sealed class LocaleState extends Equatable {
  final Locale locale;
  const LocaleState(this.locale);

  @override
  List<Object> get props => [locale];
}

final class ChangeLocaleState extends LocaleState {
  final Locale selectedLocale;
  const ChangeLocaleState(this.selectedLocale) : super(selectedLocale);
}
