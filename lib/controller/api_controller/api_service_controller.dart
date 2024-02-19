import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:poductivity_app/controller/sharedpref_controller/sharedprefcontroller.dart';
import 'package:poductivity_app/view/bottom_nav/bottom_nav.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServiceController extends ChangeNotifier {
  var obj = SharedPrefController();

  ///////////////////////////////////////////////////////////////////////////////////////////////////

  //// user login
  void login(
      {required String username,
      required String password,
      required var context}) async {
    var url = Uri.parse("http://10.0.2.2:8000/noteapp/login/");
    var response = await http
        .post(url, body: {"username": username, "password": password});
    Map jsonresponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(jsonresponse["msg"])));
      obj.addlogindetails(jsonresponse["token"], jsonresponse["id"]);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNav(),
          ));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(jsonresponse["msg"])));
    }
  }

  // userregister
  void register(
      {required var context,
      required String username,
      required String email,
      required String password}) async {
    var url = Uri.parse("http://10.0.2.2:8000/noteapp/register/");

    var response = await http.post(url, body: {
      "username": username,
      "email": email,
      "password": password,
    });
    Map jsonresponse = jsonDecode(response.body);
    List usernames = jsonresponse["username"];
    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(usernames[0])));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(usernames[0])));
    }
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // getting notes

  List notes = [];

  getNotes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');

    var url = Uri.parse("http://10.0.2.2:8000/noteapp/notes/");

    final response = await http.get(
      url,
      headers: {'Authorization': 'token $token'},
    );
    notes = jsonDecode(response.body);
    notifyListeners();
    // print(notes);
  }

  //delete
  deletenote(int id, var context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    var url = Uri.parse("http://10.0.2.2:8000/noteapp/notes/$id/");
    var response = await http.delete(
      url,
      headers: {'Authorization': 'token $token'},
    );
    Navigator.pop(context);
    // print(response);
    getNotes();
  }

//// addnote

  Future<void> addnote(
      {required String title,
      required String content,
      required String category}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    var userid = prefs.get('userid');
    var url = Uri.parse("http://10.0.2.2:8000/noteapp/notes/");

    final response = await http.post(
      url,
      headers: {'Authorization': 'token $token'},
      body: {
        'title': title,
        'content': content,
        'categorize_note': category,
        'owner': userid.toString(),
      },
    );
    getNotes();
  }

  // edit note

  editnote(int id, var context,
      {required String title,
      required String content,
      required String category}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    var useridint = prefs.get('userid');
    var userid = useridint.toString();
    print(token);
    print(id);
    try {
      var url = Uri.parse("http://10.0.2.2:8000/noteapp/notes/$id/");
      var response = await http.put(url, headers: {
        'Authorization': 'token $token'
      }, body: {
        'title': title,
        'content': content,
        'categorize_note': category,
        'owner': userid,
      });
      // print(response.statusCode);
      // print(response.body);

      Navigator.pop(context);
      getNotes();
    } catch (e) {
      print(e);
    }
  }
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///get task
  List task = [];
  gettask() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');

    var url = Uri.parse("http://10.0.2.2:8000/noteapp/todos/");

    final response = await http.get(
      url,
      headers: {'Authorization': 'token $token'},
    );
    task = jsonDecode(response.body);
    notifyListeners();
    print(task);
  }

  // addtask
  Future<void> addstask() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    var userid = prefs.get('userid');
    var url = Uri.parse("http://10.0.2.2:8000/noteapp/todos/");

    final response = await http.post(
      url,
      headers: {'Authorization': 'token $token'},
      body: {
        'title': 'title',
        'description': 'content',
        'created_time': '2024-02-13T10:24:25.449391Z',
        'reminded_date': '2024-03-29T09:34:00Z',
        'owner': userid.toString(),
      },
    );
    gettask();
  }

  // change status done / pending
  Future<void> changestatus(int id, bool status) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    var userid = prefs.get('userid');
    var url = Uri.parse("http://10.0.2.2:8000/noteapp/todos/$id/");
    bool changedstatus = !status;
    final response = await http.put(
      url,
      headers: {'Authorization': 'token $token'},
      body: {
        'title': 'title',
        'description': 'content',
        'created_time': '2024-02-13T10:24:25.449391Z',
        'reminded_date': '2024-03-29T09:34:00Z',
        'status': changedstatus.toString(),
        'owner': userid.toString(),
      },
    );
    gettask();
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}


