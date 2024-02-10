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


class PsychosList extends StatelessWidget {
  final List<PsychoModel> psychosList;

  const PsychosList({
    Key? key,
    required this.psychosList,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
          return 

          // show the list of psychos as a grid
          GridView.builder(
            itemCount: psychosList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  print('PsychosList onTap index: $index');
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
                        height: 300,
                        color: Colors.white,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const SizedBox(height: 10),
                              

                              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: 
                      CircleAvatar(
                        backgroundImage: NetworkImage(psychosList[index].imageUrl),
                      ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      psychosList[index].name,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      psychosList[index].speciality,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                      ),
                  ],
                ),

                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    
                    Text(
                      'Rating',
                      style: const TextStyle(
                        fontSize: 14,
                      )

                      ),

                Text(
                  psychosList[index].rating.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                  ),

                ),
                  ],
                ),

              ],
            ),

            const SizedBox(height: 10),




            const SizedBox(height: 10),

                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    print('Book session button pressed');
                  },
                  child: const Text('Book session'),
                ),

                const SizedBox(height: 20),

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
                        psychosList[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      psychosList[index].name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      psychosList[index].speciality,
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