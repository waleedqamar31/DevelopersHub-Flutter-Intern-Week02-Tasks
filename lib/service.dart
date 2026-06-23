import 'package:shared_preferences/shared_preferences.dart';

class Service {
  Service._();

  static final Service instance = Service._();

  late SharedPreferences sharedPreferences;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveData(String key, int value) async {
    await sharedPreferences.setInt(key, value);
  }

  int? getData(String key) {
    return sharedPreferences.getInt(key);
  }
}
