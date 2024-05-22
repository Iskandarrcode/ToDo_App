import 'package:flutter/material.dart';

class ContactEditDialog extends StatefulWidget {
  const ContactEditDialog({super.key});

  @override
  State<ContactEditDialog> createState() => _ContactEditDialogState();
}

class _ContactEditDialogState extends State<ContactEditDialog> {
  final _formkey = GlobalKey<FormState>();

  String name = "";

  String phone = "";

  void edit() {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      Navigator.pop(context, {
        "name": name,
        "phone": phone,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 206, 211, 233),
      title: const Text("Edit Contact"),
      content: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Name"),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Iltimos isim kiriting";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    name = newValue;
                  }
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("Phone number")),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Iltimos telefon raqam kiriting";
                  } else if (!RegExp(r"^\d+$").hasMatch(value)) {
                    return "Iltimos to'g'ri raqam kiriting";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    phone = newValue;
                  }
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Bekor qilish"),
        ),
        ElevatedButton(
          onPressed: edit,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: const Text("O'zgartirish"),
        )
      ],
    );
  }
}
