import 'package:flutter/material.dart';
import 'package:poductivity_app/view/group_notes/group_notes.dart';
import 'package:poductivity_app/view/note_Screen/note_screen.dart';
import 'package:poductivity_app/view/search_screen/search_screen.dart';
import 'package:poductivity_app/view/tasks_screen/task_screen.dart';

class BottomNavController extends ChangeNotifier {
  int currentindex = 0;
  List screenlist = [
    const NoteScreen(),
    const TaskScreen(),
    const SearchScreen(),
    const GroupScreen()
  ];

  void changescreen(int screenindex) {
    currentindex = screenindex;
    notifyListeners();
  }
}
