import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/contact.dart';
import 'package:untitled/viewmodels/contact_vm.dart';

import '../main.gr.dart';

class ContactListPage extends StatelessWidget {

  final double size;
  const ContactListPage(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact List"),
      ),
      body: Consumer<ContactViewModel>(
        builder: (context, contactVM, child) {
          List<Contact> contacts = contactVM.contacts;

          if (contacts.isEmpty) {
            return Column(
              children: [
                showAddButton(context, 0),
              ],
            );
          }

          return Column(
            children: [
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: contacts.length,
                itemBuilder: (context, index) {

                  final contact = contacts[index];

                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10,10,10,0),
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          AutoRouter.of(context).push(EditRoute(contact: contact));
                        },
                        title: Text(
                          contact.name,
                          style: TextStyle(
                            fontSize: size,
                          ),
                        ),
                        subtitle: Text(
                          'Number: ${contact.number}',
                          style: TextStyle(
                            fontSize: size,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              showAddButton(context, contacts.length),
            ],
          );
        },
      ),
    );
  }
}

showAddButton(context, index){
  return Expanded(
    child: Align(
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(40), // fromHeight use double.infinity as width and 40 is the height
        ),
        onPressed: () {
          AutoRouter.of(context).push(EditRoute(len: index));
        },
        child: const Text('add'),
      ),
    ),
  );
}
