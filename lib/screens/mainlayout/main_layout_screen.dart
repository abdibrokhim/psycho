import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:psycho/screens/home/home_screen.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:psycho/shared/refreshable.dart';
import 'package:psycho/screens/profile/profile_screen.dart';
import 'package:psycho/screens/user/user_reducer.dart';
import 'package:psycho/store/app/app_state.dart';
import 'package:psycho/store/app/app_store.dart';


class MainLayout extends StatefulWidget {

  const MainLayout({
    Key? key,
  }) : super(key: key);

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;


  @override
  void initState() {
    super.initState();
  }

  Widget _getContent(BuildContext context) {
    
    var state = StoreProvider.of<GlobalState>(context);

    print('MainLayout _getContent _selectedIndex: $_selectedIndex');

    
      switch (_selectedIndex) {
        case 0:
          return const HomeScreen();
        case 1:
          return const ProfileScreen();
        default:
          return const HomeScreen();
      }
    } 

  void _onTabSelected(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    var state = StoreProvider.of<GlobalState>(context);

      return 
        Scaffold(
          body: _getContent(context),

          bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
        type: BottomNavigationBarType.fixed,
      ),

  );
  }
}
