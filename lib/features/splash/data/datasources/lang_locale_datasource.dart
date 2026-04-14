import 'package:shared_preferences/shared_preferences.dart';

abstract class LangLocaleDatasource {
  Future<bool> changeLang({required String langCode});
  Future<String?> getSavedLang();
}

class LangLocaleDatasourceImpl implements LangLocaleDatasource {
  final SharedPreferences sharedPreferences;

  LangLocaleDatasourceImpl({required this.sharedPreferences});

  @override
  Future<bool> changeLang({required String langCode}) async {
    return await sharedPreferences.setString("locale", langCode);
  }

  @override
  Future<String?> getSavedLang() async {
    return sharedPreferences.containsKey("locale")
        ? sharedPreferences.getString("locale")
        : "en";
  }
}
