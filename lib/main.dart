import 'package:evg_stock_mgmt_admin/screen/add_inventory.dart';
import 'package:evg_stock_mgmt_admin/screen/analytics.dart';
import 'package:evg_stock_mgmt_admin/screen/dashboard.dart';
import 'package:evg_stock_mgmt_admin/screen/inventory.dart';
import 'package:evg_stock_mgmt_admin/screen/login.dart';
import 'package:evg_stock_mgmt_admin/screen/signup.dart';
import 'package:evg_stock_mgmt_admin/screen/user_account.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
      '/home': (BuildContext context) => const Dashboard(),
      '/signup': (BuildContext context) => const Signup(),
      '/login': (BuildContext context) => const Login(),
      '/inventory': (BuildContext context) => const Inventory(),
      '/add_inventory': (BuildContext context) => const AddInventory(),
      'analytics': (BuildContext context) => const Analytics(),
      'user_account': (BuildContext context) => const UserAccount(),
    };
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: routes,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    Inventory(),
    Analytics(),
    UserAccount()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text('Flutter Demo'),
          ),
      backgroundColor: Colors.white, // Set background color to white
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Inventory',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'Login',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}
