import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putData({
    required String key,
    required bool value,
  }) async {
    return await sharedPreferences!.setBool(key, value);
  }

  static dynamic getData({required String key}) {
    if (sharedPreferences != null) {
      return sharedPreferences!.get(key);
    }
    return null;
  }

 static Future<bool> saveDate({required String key, required dynamic value}) async{
    if(value  is String) {
      return await sharedPreferences!.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences!.setInt(key, value);
    } else if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    } else {
      return await sharedPreferences!.setDouble(key, value);
    }
  }
  static Future<bool> removetokenData({
    required String key,
  }) async {
    return await sharedPreferences!.remove(key);
  }
}
