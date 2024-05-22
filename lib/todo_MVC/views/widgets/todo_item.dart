// import 'package:flutter/material.dart';

// class TodoItem extends StatefulWidget {
//   final String title;
//   final DateTime dateTime;
//   final Function() onDelete;
//   final Function() onEdit;
//   const TodoItem({
//     super.key,
//     required this.title,
//     required this.onDelete,
//     required this.onEdit,
//     required this.dateTime,
//   });

//   @override
//   State<TodoItem> createState() => _TodoItemState();
// }

// class _TodoItemState extends State<TodoItem> {
//   @override
//   Widget build(BuildContext context) {
//     bool isTrue = false;
//     return ListTile(
//       leading: IconButton(
//         onPressed: () {
//           setState(() {
//             if (isTrue == true) {
//               isTrue = false;
//             } else {
//               isTrue = true;
//             }
//           });
//         },
//         icon: Icon(isTrue == true ? Icons.check_box_sharp : Icons.circle),
//       ),
//       title: Text(widget.title),
//       subtitle: Text(widget.dateTime.toString()),
//       trailing: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           IconButton(
//             onPressed: widget.onEdit,
//             icon: const Icon(
//               Icons.edit,
//               color: Colors.blue,
//             ),
//           ),
//           IconButton(
//             onPressed: widget.onDelete,
//             icon: const Icon(
//               Icons.delete,
//               color: Colors.red,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  final String title;
  final DateTime dateTime;
  final Function() onDelete;
  final Function() onEdit;

  const TodoItem({
    super.key,
    required this.title,
    required this.onDelete,
    required this.onEdit,
    required this.dateTime,
  });

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () {
          setState(() {
            isChecked = !isChecked;
          });
        },
        icon: Icon(isChecked ? Icons.check_box_sharp : Icons.circle),
      ),
      title: Text(widget.title),
      subtitle: Text(widget.dateTime.toString()),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: widget.onEdit,
            icon: const Icon(
              Icons.edit,
              color: Colors.blue,
            ),
          ),
          IconButton(
            onPressed: widget.onDelete,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
