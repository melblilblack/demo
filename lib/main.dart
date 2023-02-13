import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';
import 'package:untitled/pages/contact_list.dart';
import 'package:untitled/pages/edit_page.dart';
import 'package:untitled/viewmodels/contact_vm.dart';
import 'package:untitled/main.config.dart';

import 'main.gr.dart';

// void setupLocator(){
//   GetIt.I.registerLazySingleton(() => ContactViewModel());
// }

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'initial', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() => initial(getIt);

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: ContactListPage, initial: true),
    AutoRoute(page: EditPage),
  ],
)
class $AppRouter {}

void main() {
  // setupLocator();
  configureDependencies();
  ContactViewModel vm = GetIt.I<ContactViewModel>();
  runApp(
      ChangeNotifierProvider(
          create: (context) => vm,
          child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {

  final _appRouter = AppRouter();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}

