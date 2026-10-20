import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

const String LAGUAGE_CODE = 'languageCode';

// Global Language Variable
String? languageFlag;

//languages code
const String ENGLISH = 'en';

Locale? loc;
int lang = 0;
Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LAGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? "en";
  languageFlag = languageCode;
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return const Locale(ENGLISH, 'US');
    default:
      return const Locale(ENGLISH, 'US');
  }
}

void changeLanguage(BuildContext context, String language) async {
  languageFlag = language;
  Locale loc = await setLocale(language);
  MyApp.setLocale(context, loc);
}
