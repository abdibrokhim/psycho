import 'package:intl/intl.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:psycho/screens/psycho/psycho_model.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:psycho/shared/refreshable.dart';
import 'package:psycho/screens/profile/profile_screen.dart';
import 'package:psycho/screens/user/user_reducer.dart';
import 'package:psycho/store/app/app_state.dart';
import 'package:psycho/store/app/app_store.dart';


class UpcomingSessionsList extends StatelessWidget {
  final List<UpcomingSessionModel> upcomingSessionsList;

  const UpcomingSessionsList({
    Key? key,
    required this.upcomingSessionsList,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var state = StoreProvider.of<GlobalState>(context).state.appState.userState;

          return 
          // show the list of upcoming sessions as a grid
          GridView.builder(
            itemCount: upcomingSessionsList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  print('upcoming sessions onTap index: $index');
                  // open bottom sheet
                  showModalBottomSheet(
                    showDragHandle: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
  context: context,
  builder: (BuildContext context) {
    return Container(
      height: 1200,
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
                      child: Image.network(
                        upcomingSessionsList[index].imageUrl,
                        fit: BoxFit.fitHeight,
                      ),
            ),
            const SizedBox(height: 10),
            Text('Session details:'),
            const SizedBox(height: 10),
            Text("Name: ${upcomingSessionsList[index].name}"),
            const SizedBox(height: 10),
            Text(
                      "Start Date: ${DateFormat('dd.MM.yyyy').format(upcomingSessionsList[index].sessionStartDate).toString()}",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
            Text(
                      "End Date: ${DateFormat('dd.MM.yyyy').format(upcomingSessionsList[index].sessionEndDate).toString()}",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
            const SizedBox(height: 10),
            Text(
                      "Duration: ${upcomingSessionsList[index].duration}",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                CircleAvatar(
                  backgroundImage: NetworkImage(state.psychosList.where((element) => element.uuid == upcomingSessionsList[index].psychoId).first.imageUrl),
                ),
                const SizedBox(width: 10),
                Text(
                  state.psychosList.where((element) => element.uuid == upcomingSessionsList[index].psychoId).first.name,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),

                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    print('Book session button pressed');
                  },
                  child: const Text('Book session'),
                ),


          ],
        ),
      ),
    );
  },
);

                },
                child:
              Card(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.network(
                        upcomingSessionsList[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      upcomingSessionsList[index].name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      DateFormat('dd.MM.yyyy').format(upcomingSessionsList[index].sessionStartDate).toString(),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      upcomingSessionsList[index].duration,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                ),
              );
            },
          );
  }
}