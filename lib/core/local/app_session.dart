import 'package:shared_preferences/shared_preferences.dart';

import '../constant/global_const.dart';

mixin AppSession {
  final Future<SharedPreferences> _sharedPreferences = SharedPreferences.getInstance();

  Future<String?> getString(String key) async {
    return await _sharedPreferences.then((preference) => Future.value(preference.getString(key)));
  }

  Future<bool> setString({required String key, required String value}) async {
    console('Writing key: $key value: $value');
    return await _sharedPreferences.then((preference) => Future.value(preference.setString(key, value)));
  }

  Future<int?> getInt(String key) {
    return _sharedPreferences.then((preference) => Future.value(preference.getInt(key)));
  }

  Future<bool> setInt({required String key, required int value}) async {
    console('Writing key: $key value: $value');
    return await _sharedPreferences.then((preference) => Future.value(preference.setInt(key, value)));
  }

  Future<bool> setBool({required String key, required bool value}) async {
    console('Writing key: $key value: $value');
    return await _sharedPreferences.then((preference) => Future.value(preference.setBool(key, value)));
  }

  Future<bool?> getBool(String key) {
    return _sharedPreferences.then((preferences) => Future.value(preferences.getBool(key)));
  }

  Future<bool> setFutureStringList({required String key, required List<String> value}) async {
    return await _sharedPreferences.then((preference) => Future.value(preference.setStringList(key, value)));
  }

  Future<List<String>?> getFutureStringList(String key) async {
    return _sharedPreferences.then((preference) => Future.value(preference.getStringList(key)));
  }

  Future<bool> clearPreference() async {
    return await _sharedPreferences.then((preference) => Future.value(preference.clear()));
  }
}

// mixin StreamPreferenceManager {
//   final Future<SharedPreferences> _sharedPreferences = SharedPreferences.getInstance();
//
//   Stream<String?> getString({required String key}) {
//     return _getSharedPreference().map((preference) => preference.getString(key));
//   }
//
//   Stream<bool> setString({required String key, required String value}) {
//     debugPrint('Writing key: $key value: $value');
//     return _getSharedPreference()
//         .flatMap((preference) => _convertToRx(preference.setString(key, value)));
//   }
//
//   Stream<bool> setBool({required String key, required bool value}) {
//     return _getSharedPreference().flatMap((preference) => _convertToRx(preference.setBool(key, value)));
//   }
//
//   Stream<bool?> getStreamBool(String key) {
//     return _getSharedPreference().map((preference) => preference.getBool(key));
//   }
//
//   Stream<List<String>?> getStringList({required String key}) {
//     debugPrint('Reading key: $key value: $key');
//     return _getSharedPreference().map((preference) => preference.getStringList(key));
//   }
//
//   Stream<bool> setStringList({required String key, required List<String> value}) {
//     debugPrint('Writing key: $key value: $value');
//     return _getSharedPreference()
//         .flatMap((preference) => _convertToRx(preference.setStringList(key, value)));
//   }
//
//   Stream<bool> clearPreference() {
//     return _getSharedPreference().flatMap((preference) => _convertToRx(preference.clear()));
//   }
//
//   Stream<SharedPreferences> _getSharedPreference() {
//     return _convertToRx(_sharedPreferences);
//   }
//
//   Stream<T> _convertToRx<T>(Future<T> future) {
//     return Stream.fromFuture(future);
//   }
// }
