import 'package:shared_preferences/shared_preferences.dart';
class SharedPreferencesHelper {
  static Future<void> storeName(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', token);
    print('Token stored in shared preferences: $token');
  }
  static Future<void> storeEmail(String role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', role);
    print('Role stored in shared preferences: $role');
  }


// Retrieving the token value from shared preferences
  static Future<String?> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('name');
    print('Token retrieved from shared preferences: $token');
    return token;
  }
  static Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('email');
    print('Token retrieved from shared preferences: $token');
    return token;
  }
    static Future<void> storePhone(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('phone', token);
    print('Token stored in shared preferences: $token');
  }
  static Future<void> storeAddress(String role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('address', role);
    print('Role stored in shared preferences: $role');
  }
    static Future<String?> getPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('phone');
    print('Token retrieved from shared preferences: $token');
    return token;
  }
  static Future<String?> getAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('address');
    print('Token retrieved from shared preferences: $token');
    return token;
  }

  static Future<void> deleteUser(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print('User Deleted Successfully: $token');
  }
}
