import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _sharedPreferences;

  // هذه الدالة التي تستدعينها في الـ main
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // دالة لجلب البيانات
  static dynamic getData({required String key}) {
    return _sharedPreferences!.get(key); // هنا لن ينهار لأنه تم عمل init في الـ main
  }

  // دالة للحفظ
  static Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is String) return await _sharedPreferences!.setString(key, value);
    if (value is int) return await _sharedPreferences!.setInt(key, value);
    if (value is bool) return await _sharedPreferences!.setBool(key, value);
    return await _sharedPreferences!.setDouble(key, value);
  }
}


//
// import 'package:shared_preferences/shared_preferences.dart';
//
// class CacheHelper {
//   static late SharedPreferences _sharedPreferences;
//
//   /// Initialize SharedPreferences (must be called before any other method).
//   static Future<void> init() async {
//     _sharedPreferences = await SharedPreferences.getInstance();
//   }
//
//   /// Checks if preferences is initialized.
//   static bool _isInitialized() {
//     return true;
//   }
//
//   /// Saves data to local storage with dynamic type handling.
//   /// Supported types: String, bool, int, double.
//   static Future<bool> saveData({
//     required String key,
//     required dynamic value,
//   }) async {
//     _isInitialized();
//
//     if (value is bool) {
//       return await _sharedPreferences.setBool(key, value);
//     } else if (value is String) {
//       return await _sharedPreferences.setString(key, value);
//     } else if (value is int) {
//       return await _sharedPreferences.setInt(key, value);
//     } else if (value is double) {
//       return await _sharedPreferences.setDouble(key, value);
//
//       //   // إضافة دعم القوائم
//     } else if (value is List<String>) {
//       return await _sharedPreferences.setStringList(key, value);
//
//     } else {
//       throw ArgumentError('Invalid type: ${value.runtimeType}');
//     }
//   }
//
//   /// Retrieves data from local storage (returns `null` if not found).
//   static dynamic getData({required String key}) {
//     _isInitialized();
//     return _sharedPreferences.get(key);
//   }
//
//   /// Removes data for a specific key.
//   static Future<bool> removeData({required String key}) async {
//     _isInitialized();
//     return await _sharedPreferences.remove(key);
//   }
//
//   /// Clears all data in local storage.
//   static Future<bool> clearAllData() async {
//     _isInitialized();
//     return await _sharedPreferences.clear();
//   }
//
//   /// Checks if a key exists.
//   static bool containsKey({required String key}) {
//     _isInitialized();
//     return _sharedPreferences.containsKey(key);
//   }
// }
