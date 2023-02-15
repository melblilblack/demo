import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../theme.dart';

class SettingPage extends StatefulWidget {

  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  double? _currentSliderValue;
  bool? dark;

  @override
  Widget build(BuildContext context) {
    _currentSliderValue =_currentSliderValue ?? Theme.of(context).textTheme.bodyMedium!.fontSize;
    dark = dark ?? false;
    AppTheme theme = GetIt.I<AppTheme>();
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
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Dark Mode",
                style: TextStyle(
                    fontSize: 18
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,10,20,10),
            child: Switch(
              // This bool value toggles the switch.
              value: dark!,
              activeColor: Colors.black,
              onChanged: (bool value) {
                // This is called when the user toggles the switch.
                setState(() {
                  dark = value;
                });
              },
            )
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
                  //Theme.of(context).textTheme.bodyMedium = TextStyle(fontSize: _currentSliderValue);
                    theme.updateFontSize(_currentSliderValue);
                    if (dark == true) {
                      theme.updateColor(Brightness.dark);
                    }else{
                      theme.updateColor(Brightness.light);
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
