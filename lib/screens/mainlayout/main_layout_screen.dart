import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
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


    void reFetchData()  {
          print('refetching market list');
        store.dispatch(FetchShopsWithDebtsAction(store.state.appState.userState.user!.uid));
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    reFetchData();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    _refreshController.loadComplete();
  }


  Widget _getContent(BuildContext context) {
    
    var state = StoreProvider.of<GlobalState>(context);

    print('Test print from MainLayout');
    if (state.state.appState.userState.showSinglePostScreen && state.state.appState.userState.selectedPostId != null) {
      return const SinglePostScreen();
    }
    if (state.state.appState.profileScreenState.showUserProfileScreen && (state.state.appState.profileScreenState.selectedUserId != null || state.state.appState.userState.userId != null)) {
      return const ProfileScreen();
    }

    if (!state.state.appState.userState.isLoggedIn) {
      if (state.state.appState.userState.showSignUpScreen) {
        return const SignUpScreen();
      } else if (state.state.appState.userState.showForgotPasswordScreen) {
        return const ForgotPasswordScreen();
      }

      switch (_selectedIndex) {
        case 0:
          return const HomeScreen();
        case 1:
          return const FilterScreen();
        case 2:
          return const ExploreScreen();
        default:
          return const SignInScreen();
      }
    } else {
      switch (_selectedIndex) {
        case 0:
          return const HomeScreen();
        case 1:
          return const FilterScreen();
        case 2:
          return const ExploreScreen();
        case 3:
          return ProfileScreen(userId: store.state.appState.userState.userId);
        case 4:
          return const SettingsScreen();
        default:
          return const HomeScreen();
      }
    }
  }

  void _onTabSelected(int index) {
    store.dispatch(SinglePostBackAction());
    store.dispatch(ResetAuthScreensRequestAction());
    store.dispatch(HideUserProfileRequestAction());
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
      if (_selectedIndex == 3 && store.state.appState.userState.userId != null && store.state.appState.userState.isLoggedIn) {
        print('user id: ${store.state.appState.userState.userId}');
        store.dispatch(ShowUserProfileRequestAction(store.state.appState.userState.userId!));
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    var state = StoreProvider.of<GlobalState>(context);

      return 
        Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.menu_rounded),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_2_rounded),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfileScreen()),
                  );
                },
              ),
            ],
          ),
          body: _getContent(context),

          bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_rounded),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
        type: BottomNavigationBarType.fixed,
      ),
        );
        }
      );
  }
}
