import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:untitled/main.gr.dart';

class SettingPage extends StatefulWidget {

  final double size;
  final _sizeController = TextEditingController();

  SettingPage(this.size, {super.key}){
    _sizeController.text = size.toString();
  }

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Font Size Setting"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20,10,20,0),
            child: TextField(
              controller: widget._sizeController,
              decoration: const InputDecoration(hintText: 'Font Size'),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40), // fromHeight use double.infinity as width and 40 is the height
                ),
                onPressed: () {
                  if (widget._sizeController.text != '') {
                    AutoRouter.of(context).navigate(ContactListRoute(
                        size: double.parse(widget._sizeController.text)));
                  }else{
                    showAlertDialog(context, AutoRouter.of(context));
                  }
                },
                child: const Text('Save'),
              ),
            ),
          ),
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
    content: const Text("Font size cannot be empty"),
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
