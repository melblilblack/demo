import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled/models/contact.dart';
import 'package:untitled/pages/edit_page.dart';
import 'package:untitled/viewmodels/contact_vm.dart';

class ContactList extends StatelessWidget {

  ContactViewModel get _vm => GetIt.I<ContactViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact List"),
      ),
      body: StreamBuilder<List<Contact>>(
        stream: _vm.outContactList,
        builder: (content, snapshot) {

          if (!snapshot.hasData) {
            return Column(
              children: [
                showAddButton(context, 0),
              ],
            );
          }


          final contacts = snapshot.data;
          final length = contacts != null ? contacts.length : 0;

          return Column(
            children: [
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: contacts?.length,
                itemBuilder: (context, index) {

                  final contact = contacts![index];

                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10,10,10,0),
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => EditPage(contact: contact)));
                        },
                        title: Text(contact.name),
                        subtitle: Text('Number: ${contact.number}'),
                      ),
                    ),
                  );
                },
              ),
              showAddButton(context, length),
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
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => EditPage(len: index)));
        },
        child: const Text('add'),
      ),
    ),
  );
}
