import 'package:dars1/todo_MVC/models/todo_model.dart';

class ToDoController {
  final List<ToDo> _list = [
    ToDo(title: "Home work", dates: DateTime(2024, 6, 15), isDone: true),
    ToDo(title: "Work Tasks", dates: DateTime(2024, 7, 16), isDone: true),
    ToDo(title: "GEM", dates: DateTime(2024, 6, 22), isDone: false),
    ToDo(title: "Study", dates: DateTime(2024, 8, 5), isDone: true),
    ToDo(title: "Speaking", dates: DateTime(2024, 6, 30), isDone: false),

  ];

  List<ToDo> get list {
    return [..._list];
  }

  void todoAdd(String title, DateTime dates) {
    _list.add(ToDo(title: title, dates: dates));
  }

  void todoRemove(int index) {
    _list.removeAt(index);
  }

  void todoEdit(int index, String newTitle, DateTime newDates) {
    _list[index].title = newTitle;
    _list[index].dates = newDates;
  }
}
