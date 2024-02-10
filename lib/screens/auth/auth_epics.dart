import 'dart:async';
import 'package:psycho/screens/auth/firebase_auth_service.dart';
import 'package:psycho/screens/user/user_reducer.dart';
import 'package:psycho/store/app/app_store.dart';
import 'package:psycho/utils/error_reducer.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';


Stream<dynamic> googleAuthEpic(Stream<dynamic> actions, EpicStore<GlobalState> store) {
  return actions
      .where((action) => action is SignInWithGoogle) 
      .asyncMap((action) => FirebaseAuthService.signInWithGoogle())
      .flatMap<dynamic>((value) => Stream.fromIterable([
            SignInWithGoogleSuccessAction(value),
          ]))
      .onErrorResume((error, stackTrace) => Stream.fromIterable([
            HandleGenericErrorAction('Error while signing in with google'),
          ]));
}



List<Stream<dynamic> Function(Stream<dynamic>, EpicStore<GlobalState>)> authEffects = [
  googleAuthEpic
];
