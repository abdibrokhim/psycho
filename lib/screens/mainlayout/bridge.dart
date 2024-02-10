import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:psycho/screens/auth/components/secure_storage.dart';
import 'package:psycho/screens/auth/signin/signin_screen.dart';
import 'package:psycho/screens/mainlayout/main_layout_screen.dart';
import 'package:psycho/screens/user/user_reducer.dart';
import 'package:psycho/store/app/app_store.dart';


class Bridge extends StatelessWidget {
  const Bridge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String userId = '';

    return StoreConnector<GlobalState, UserState>(
      onInit: (app) async {
        var data = await StorageService.readItemsFromToKeyChain();
        userId = data['uuid'] ?? ''; 
        print('Bridge onInit userId: $userId');
      },
        converter: (store) => store.state.appState.userState,
        builder: (context, userState) {
          return (userState.isLoggedIn || userId != '') ? const MainLayout() : const SignInScreen();
        }
    );
  }
}