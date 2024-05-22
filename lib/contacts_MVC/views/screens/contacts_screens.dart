import 'package:dars1/contacts_MVC/controllers/contacts_controller.dart';
import 'package:dars1/contacts_MVC/views/widgets/contact_add_dilalog.dart';
import 'package:dars1/contacts_MVC/views/widgets/contact_edit_dialog.dart';
import 'package:dars1/contacts_MVC/views/widgets/contact_item.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final contactsController = ContactsController();
  void deleteT(int index) {
    contactsController.delete(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        actions: [
          IconButton(
            onPressed: () async {
              Map<String, dynamic>? data = await showDialog(
                  context: context,
                  builder: (ctx) {
                    return ContactAddDilalog();
                  });
              contactsController.add(data!['name'], data["phone"]);
              setState(() {});
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: contactsController.list.length,
        itemBuilder: (ctx, index) {
          return ContactItem(
            contactsController.list[index],
            onDelete: () {
              deleteT(index);
            },
            onEdit: () async {
              Map<String, dynamic>? data = await showDialog(
                  context: context,
                  builder: (ctx) {
                    return const ContactEditDialog();
                  });

              contactsController.edit(index, data!["name"], data["phone"]);
              setState(() {});
              // contactsController.add(data!['name'], data["phone"]);
            },
          );
        },
      ),
    );
  }
}
