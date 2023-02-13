import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:untitled/main.gr.dart';

class DashboardPage extends StatelessWidget {
  final double size = 15;

  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      // list of your tab routes
      // routes used here must be declaraed as children
      // routes of /dashboard
      routes: [
        ContactListRoute(size: size),
        SettingRoute(size: size),
      ],
      builder: (context, child, animation) {
        // obtain the scoped TabsRouter controller using context
        final tabsRouter = AutoTabsRouter.of(context);
        // Here we're building our Scaffold inside of AutoTabsRouter
        // to access the tabsRouter controller provided in this context
        //
        //alterntivly you could use a global key
        return Scaffold(
            body: FadeTransition(
              opacity: animation,
              // the passed child is techinaclly our animated selected-tab page
              child: child,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) {
                // here we switch between tabs
                tabsRouter.setActiveIndex(index);
              },
              items: const [
                BottomNavigationBarItem(label: 'Contacts', icon: Icon(Icons.contacts)),
                BottomNavigationBarItem(label: 'Setting', icon: Icon(Icons.settings)),
              ],
            ));
      },
    );
  }
}