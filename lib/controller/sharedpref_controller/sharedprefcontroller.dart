import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController {
  var login;
  var token;
  var userid;
  addlogindetails(String tokens, int userid) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("login", true);
    await prefs.setString("token", tokens);
    await prefs.setInt("userid", userid);
    login = true;
    token = tokens;
    userid = userid;
    // print(userid);
  }

  fetchlogindatails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    login = prefs.get("login");
    token = prefs.get("token");
    userid = prefs.get("userid");
    // print(login);
    // print(token);
    // print(prefs.get("userid"));
  }

  logoutuser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("login", false);
    prefs.setString("token", "");
    login = prefs.get("login");
    token = prefs.get("token");
    // print(login);
    // print(token);
  }
}
