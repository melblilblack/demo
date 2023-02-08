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
  late bool read;

  EditPage({this.contact, len}) {
    if (isEditing) {
      _nameController.text = contact!.name;
      _numberController.text = contact!.number;
      this.index = contact!.id;
      this.read = true;
    }
    else{
      this.index = len;
      this.read = false;
    }

  }

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {


  ContactViewModel get _vm => GetIt.I<ContactViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
        actions: <Widget>[
          widget.isEditing ? Row(
            children: [
              widget.read ? IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  setState(() {
                    widget.read = false;
                  });
                },
              ) : IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    widget.read = true;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  _vm.removeContact(widget.contact!.id);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ) : Container()
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,10,20,0),
            child: TextField(
              controller: widget._nameController,
              decoration: InputDecoration(hintText: 'Name'),
              readOnly: widget.read,
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,10,20,0),
            child: TextField(
              controller: widget._numberController,
              decoration: InputDecoration(hintText: 'Number'),
              readOnly: widget.read,
            ),
          ),
          !widget.read ? Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(
                        40), // fromHeight use double.infinity as width and 40 is the height
                  ),
                  onPressed: () {
                    if (widget._nameController.text != '') {
                      final contact = Contact(this.widget.index, widget._nameController.text,
                          widget._numberController.text);
                      if (widget.isEditing) {
                        _vm.updateContact(contact);
                      } else {
                        _vm.addContact(contact);
                      }
                      Navigator.of(context).pop();
                    }else{
                      showAlertDialog(context);
                    }

                  },
                  child: Text('Save'),
              ),
            ),
          ) : Container(),
        ],
      ),
    );
  }
}

showAlertDialog(context) {
  // Create button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Error"),
    content: Text("Name cannot be empty"),
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
