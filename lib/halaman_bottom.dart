import 'package:flutter/material.dart';
import 'package:pembelajaran_ke_5/account_screen.dart';
import 'package:pembelajaran_ke_5/favorit_screen.dart';
import 'package:pembelajaran_ke_5/home_screen.dart';
import 'package:pembelajaran_ke_5/search_screen.dart';

class HalamanBottom extends StatefulWidget {
  const HalamanBottom({super.key});

  @override
  State<HalamanBottom> createState() => _HalamanBottomState();
}

class _HalamanBottomState extends State<HalamanBottom> {
  int currentIndex = 0;
  final listBottom = [
    const HomeScreen(),
    const SearchScreen(),
    const FavoritScreen(),
    const AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listBottom[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.blueGrey,
        elevation: 8,
        currentIndex: currentIndex,
        onTap: (value){
          setState(() {
            currentIndex = value;
          });
        },
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),
          label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search),
          label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),
          label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle),
          label: "Account"),
        ]
        ),
    );
  }
}