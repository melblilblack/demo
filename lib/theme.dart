import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class AppTheme extends ChangeNotifier{
  ThemeData theme = ThemeData(
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 15
      )
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue, brightness: Brightness.light)
  );

  updateFontSize(size){
    // theme = Theme.of(context).copyWith(textTheme: Theme.of(context).textTheme.copyWith(bodyMedium: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: _currentSliderValue)));
    theme = theme.copyWith(textTheme: theme.textTheme.copyWith(bodyMedium: theme.textTheme.bodyMedium!.copyWith(fontSize: size)));
    notifyListeners();
  }

  updateColor(brightness){
    // theme = Theme.of(context).copyWith(textTheme: Theme.of(context).textTheme.copyWith(bodyMedium: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: _currentSliderValue)));
    theme = theme.copyWith(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue, brightness: brightness));
    notifyListeners();
  }
}
