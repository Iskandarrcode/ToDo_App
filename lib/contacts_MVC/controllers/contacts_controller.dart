import 'dart:math';

import 'package:dars1/contacts_MVC/models/contact.dart';
import 'package:flutter/material.dart';

class ContactsController {
  final List<Contact> _list = [
    Contact(
      name: "Tom",
      phone: "+999 91 234 56 78",
      color: const Color.fromARGB(255, 120, 181, 234),
    ),
    Contact(
      name: "Jerry",
      phone: "+999 91 123 45 67",
      color: Colors.orange,
    ),
    Contact(
      name: "Spike",
      phone: "+999 91 234 66 90",
      color: Colors.grey,
    ),
  ];

  List<Contact> get list {
    return [..._list];
  }

  void delete(int index) {
    _list.removeAt(index);
  }

  void edit(int index, String newName, String phoneNumber) {
    _list[index].name = newName;
    _list[index].phone = phoneNumber;
  }

  void add(String name, String phone) {
    _list.add(
      Contact(
        name: name,
        phone: phone,
        color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256),
            Random().nextInt(256)),
      ),
    );
  }
}
