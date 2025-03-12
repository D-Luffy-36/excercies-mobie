
import 'package:flutter/material.dart';
import './pages/manager.page.dart';

class Home extends StatefulWidget {




   const Home({super.key});

   @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }

}

class _HomeState extends State<Home> {
  int tab = 0;
  List<NavigationDestination> appBarDestinations = const [
    NavigationDestination(
      icon: Icon(Icons.admin_panel_settings),
      label: "Quản Lí",
      selectedIcon: Icon(Icons.admin_panel_settings),
    ),
    NavigationDestination(
      icon: Icon(Icons.menu_book),
      label: "Danh Sách Sách",
      selectedIcon: Icon(Icons.menu_book),
    ),
    NavigationDestination(
      icon: Icon(Icons.person),
      label: "Nhân Viên",
      selectedIcon: Icon(Icons.person),
    ),
  ];
  final pages = [
    Center(child: ManagerPage(),),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: IndexedStack(
        index: tab,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (int index) {
          setState(() {
            tab = index;
          });
        },
          destinations: appBarDestinations
      ),
    );
  }

}