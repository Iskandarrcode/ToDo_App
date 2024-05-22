import 'package:dars1/todo_MVC/controllers/todo_controllers.dart';
import 'package:dars1/todo_MVC/views/widgets/todo_add.dart';
import 'package:dars1/todo_MVC/views/widgets/todo_edit.dart';
import 'package:dars1/todo_MVC/views/widgets/todo_item.dart';
import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final todoController = ToDoController();
  late int completedTodosCount;
  late int completedNotTodosCount;

  @override
  void initState() {
    super.initState();
    completedTodosCount =
        todoController.list.where((todo) => todo.isDone).toList().length;
    completedNotTodosCount = todoController.list
        .where((element) => element.isDone == false)
        .toList()
        .length;
  }

  void deleteT(int index) {
    todoController.todoRemove(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 38, 88),
        title: const Text(
          "ToDo App",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              Map<String, dynamic>? data = await showDialog(
                  context: context,
                  builder: (ctx) {
                    return const ToDoAdd();
                  });
              todoController.todoAdd(data!['title'], data["date"]);
              setState(() {});
            },
            icon: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Done: $completedTodosCount",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Not Done: $completedNotTodosCount",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoController.list.length,
              itemBuilder: (context, index) {
                return TodoItem(
                  title: todoController.list[index].title,
                  onDelete: () {
                    deleteT(index);
                  },
                  onEdit: () async {
                    Map<String, dynamic>? data = await showDialog(
                        context: context,
                        builder: (ctx) {
                          return const ToDoEdit();
                        });

                    todoController.todoEdit(
                        index, data!["title"], data["date"]);
                    setState(() {});
                    // contactsController.add(data!['name'], data["phone"]);
                  },
                  dateTime: todoController.list[index].dates,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
