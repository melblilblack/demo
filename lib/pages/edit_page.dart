import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled/viewmodels/contact_vm.dart';

import '../models/contact.dart';

class EditPage extends StatefulWidget {

  final Contact? contact;
  late final int index;
  bool get isEditing => contact != null;
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();

  EditPage({super.key, this.contact, len}) {
    if (isEditing) {
      _nameController.text = contact!.name;
      _numberController.text = contact!.number;
      index = contact!.id;
    }
    else{
      index = len;
    }
  }

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

  bool? read;
  final ContactViewModel _vm = GetIt.I<ContactViewModel>();

  @override
  Widget build(BuildContext context) {
    read = read ?? widget.isEditing;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        actions: <Widget>[
          widget.isEditing ? Row(
            children: [
              read! ? IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  setState(() {
                    read = false;
                  });
                },
              ) : IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    read = true;
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  _vm.removeContact(widget.contact!.id);
                  context.router.pop();
                },
              ),
            ],
          ) : Container()
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,10,20,0),
            child: TextField(
              controller: widget._nameController,
              decoration: const InputDecoration(hintText: 'Name'),
              readOnly: read!,
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,10,20,0),
            child: TextField(
              controller: widget._numberController,
              decoration: const InputDecoration(hintText: 'Number'),
              readOnly: read!,
            ),
          ),
          read! ? Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(
                        40), // fromHeight use double.infinity as width and 40 is the height
                  ),
                  onPressed: () {
                    if (widget._nameController.text != '') {
                      final contact = Contact(widget.index, widget._nameController.text,
                          widget._numberController.text);
                      if (widget.isEditing) {
                        _vm.updateContact(contact);
                      } else {
                        _vm.addContact(contact);
                      }
                      context.router.pop();
                    }else{
                      showAlertDialog(context, context.router);
                    }

                  },
                  child: const Text('Save'),
              ),
            ),
          ) : Container(),
        ],
      ),
    );
  }
}

showAlertDialog(context, router) {
  // Create button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      router.pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Error"),
    content: const Text("Name cannot be empty"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
