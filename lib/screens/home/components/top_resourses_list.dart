import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:psycho/shared/refreshable.dart';
import 'package:psycho/screens/profile/profile_screen.dart';
import 'package:psycho/screens/user/user_reducer.dart';
import 'package:psycho/store/app/app_state.dart';
import 'package:psycho/store/app/app_store.dart';


class TopResourcesList extends StatelessWidget {

  const TopResourcesList({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
          return 
    Expanded(
      child: Text('TopResourcesList'),
    );
  }
}