// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:groceries_vegetables_app/pages/homepage.dart';

import '../constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentMenu = 0;
  Widget body() {
    switch (currentMenu) {
      case 0:
        return const HomePage();
      case 1:
        return const Center(
          child: Text('Data'));
          case 2:
           return const Center(
          child: Text('Hello'));
          case 3:
        return const Center(
          child: Text('Mercy'),
        );

        break;
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentMenu,
          unselectedItemColor: Colors.grey,
          selectedItemColor: darkblue,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              currentMenu = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.insert_chart_outlined_rounded), label: 'home'),
            BottomNavigationBarItem(
                icon: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green),
                    child: Icon(
                      Icons.qr_code_scanner_outlined,
                      color: Colors.white,
                    )),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline_rounded), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_rounded), label: 'home'),
          ]),
    );
  }
}
