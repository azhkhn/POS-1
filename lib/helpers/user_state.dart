
import 'package:shared_preferences/shared_preferences.dart';


class UserSimplePreferences{
  static  late  SharedPreferences _preferences;

  static const _keyUsername = 'Username';
  static const _keyPassword = 'Password';
  static const _keyUserstate = 'Logged State';
  static const _keyUserLogindataAvailablestate = 'LoginData';
  static const _keyUserDashboardAvailablestate = 'DashboardData';
  static const _keyIsPrivacyFormChecked = 'PrivacyForm';
  static const _keyIsCovidFormChecked = 'CovidForm';

  static Future initState() async{
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setUserName(String username) async {
    await _preferences.setString(_keyUsername, username);
  }

  static String? getUserName() {
    return _preferences.getString(_keyUsername);
  }

  static Future setPassword(String password) async {
    await _preferences.setString(_keyPassword, password);
  }

  static String? getPassword() {
    return _preferences.getString(_keyPassword);
  }

  static Future setLoginState(String loginstate) async {
    await _preferences.setString(_keyUserstate, loginstate);
  }

  static String? getLoginState() {
    return _preferences.getString(_keyUserstate);
  }

  static Future setUserLoginDataState(String userlogindata) async {
    await _preferences.setString(_keyUserLogindataAvailablestate, userlogindata);
  }

  static String? getUserLoginDataState() {
    return _preferences.getString(_keyUserLogindataAvailablestate);
  }

  static Future setDashboardDataState(String dashboarddata) async {
    await _preferences.setString(_keyUserDashboardAvailablestate, dashboarddata);
  }

  static String? getDashboardDataState() {
    return _preferences.getString(_keyUserDashboardAvailablestate);
  }

  static Future setisPrivacyFormChecked(bool value) async {
    await _preferences.setBool(_keyIsPrivacyFormChecked, value);
  }

  static bool? getPrivacyFormstatus() {
    return _preferences.getBool(_keyIsPrivacyFormChecked);
  }

  static Future setisCovidFormChecked(bool value) async {
    await _preferences.setBool(_keyIsCovidFormChecked, value);
  }

  static bool? getCovidFormstatus() {
    return _preferences.getBool(_keyIsCovidFormChecked);
  }

}