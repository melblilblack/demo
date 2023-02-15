import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:untitled/main.gr.dart';

class SettingPage extends StatefulWidget {

  final double size;

  const SettingPage(this.size, {super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  double? _currentSliderValue;

  @override
  Widget build(BuildContext context) {
    _currentSliderValue =_currentSliderValue ?? widget.size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select font size",
                style: TextStyle(
                  fontSize: 18
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,10,20,10),
            child: Slider(
              value: _currentSliderValue!,
              min: 5,
              max: 30,
              divisions: 5,
              label: _currentSliderValue!.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
            // TextField(
            //   controller: widget._sizeController,
            //   decoration: const InputDecoration(hintText: 'Font Size'),
            // ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40), // fromHeight use double.infinity as width and 40 is the height
                ),
                onPressed: () {
                  AutoRouter.of(context).navigate(ContactListRoute(
                      size: double.parse(_currentSliderValue!.toString())));
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
