import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:psycho/shared/refreshable.dart';
import 'package:psycho/screens/profile/profile_screen.dart';
import 'package:psycho/screens/user/user_reducer.dart';
import 'package:psycho/store/app/app_state.dart';
import 'package:psycho/store/app/app_store.dart';

import 'components/psychos_list.dart';
import 'components/top_resourses_list.dart';
import 'components/upcoming_sessions_list.dart';


class HomeScreen extends StatefulWidget {

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;


  @override
  void initState() {
    super.initState();
  }


    void reFetchData()  {
      print('reFetchData HomeScreen');
      
          print('refetching psychos list');
        store.dispatch(FetchAllPsychosList());

          print('refetching upcoming sessions list');
        store.dispatch(FetchAllUpcomingSessionList());
          
          print('refetching top resources list');
        store.dispatch(FetchAllTopResourcesList());
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


  @override
  Widget build(BuildContext context) {
    var state = StoreProvider.of<GlobalState>(context);

      return StoreConnector<GlobalState, UserState>(
        onInit: (app) {
          print('onInit HomeScreen');
          
          print('fetching psychos');
        store.dispatch(FetchAllPsychosList());

          print('fetching upcoming sessions');
        store.dispatch(FetchAllUpcomingSessionList());
          
          print('fetching top resources');
        store.dispatch(FetchAllTopResourcesList());
          
        },
        converter: (store) => store.state.appState.userState,
        builder: (context, userState) {
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
          body: Refreshable(
            refreshController: _refreshController,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            child: 

          Padding(
              padding: const EdgeInsets.all(20),
              child:
          Column(
            children: [
             
              const SizedBox(height: 32.0,),

              // TODO: psychos

                       userState.isMarketListLoading
            ? Center(child: SizedBox(
              child:const CircularProgressIndicator()))
            :
          Expanded(
            child: 
              const PsychosList()
          ),

          // TODO: upcoming sessions
                       userState.isMarketListLoading
            ? Center(child: SizedBox(
              child:const CircularProgressIndicator()))
            :
          Expanded(
            child: 
              const UpcomingSessionsList()
          ),

          // TODO: top resources
                       userState.isMarketListLoading
            ? Center(child: SizedBox(
              child:const CircularProgressIndicator()))
            :
          Expanded(
            child: 
              const TopResourcesList()
          )
            ],
          )
          )
          )
        );
        }
      );
  }
}