import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:psycho/screens/auth/components/google_provider.dart';
import 'package:psycho/screens/mainlayout/main_layout_screen.dart';
import 'package:psycho/screens/user/user_reducer.dart';
import 'package:psycho/store/app/app_store.dart';


class SignInScreen extends StatefulWidget {
  static String routeName = "/signIn";
  
  final VoidCallback? onSignUpRequested;
  final VoidCallback? onForgotPasswordRequested;
  
  const SignInScreen({
    Key? key, 
    this.onSignUpRequested,
    this.onForgotPasswordRequested,
  }) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  List<String> errors = [];

  @override
  void initState() {
    super.initState();

    initErrors();
  }

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  void initErrors() {
    setState(() {
      errors = [];
    });
  }

  bool showOnce = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: StoreConnector<GlobalState, UserState>(
        converter: (store) => store.state.appState.userState,
        builder: (context, userState) {
          return const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child:
            Column(
              children: [
               
                SizedBox(
                  width: 300,
child:
                SignInWithGoogleWidget(),
                ),
                SizedBox(height: 20,),
              ],
            ),
            ),
          );
        },
        onDidChange: (prev, next) {
          if (next.isLoggedIn && next.user != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainLayout()),
            );
          }
        },
        onDispose: (store) {},
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
