import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:psycho/screens/home/components/meeting_screen.dart';
import 'package:psycho/screens/psycho/psycho_model.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:psycho/shared/refreshable.dart';
import 'package:psycho/screens/profile/profile_screen.dart';
import 'package:psycho/screens/user/user_reducer.dart';
import 'package:psycho/store/app/app_state.dart';
import 'package:psycho/store/app/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;


class PsychosList extends StatefulWidget {
  final List<PsychoModel> psychosList;

  const PsychosList({
    Key? key,
    required this.psychosList,
  }) : super(key: key);

  @override
  _PsychosListState createState() => _PsychosListState();
}


class _PsychosListState extends State<PsychosList> {

    DateTime? selectedDate;
TimeOfDay? startTime;
TimeOfDay? endTime;

  Widget build(BuildContext context) {


Future<void> _selectCheckInDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate ?? DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2101),
  );
  if (picked != null && picked != selectedDate) {
    setState(() {
      selectedDate = picked;
    });
    print('selectedDate: $selectedDate');
  }
}

Future<void> _selectTime(BuildContext context, {required bool isStartTime}) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: isStartTime ? startTime ?? TimeOfDay.now() : endTime ?? TimeOfDay.now(),
  );
  if (picked != null) {
    if (isStartTime) {
      setState(() {
        startTime = picked;
      });
    } else {
      setState(() {
        endTime = picked;
      });
    }
    print('startTime: $startTime');
    print('endTime: $endTime');
  }
}


Duration calculateDuration(TimeOfDay start, TimeOfDay end, BuildContext context) {
  final now = DateTime.now();
  final dtStart = DateTime(now.year, now.month, now.day, start.hour, start.minute);
  final dtEnd = DateTime(now.year, now.month, now.day, end.hour, end.minute);
  return dtEnd.difference(dtStart);
}
      

void bookSession(String psychoUuid, BuildContext context) {
  print('bookSession psychoUuid: $psychoUuid');
  // open bottom sheet with a calendar
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return Container(
  height: 600,
  color: Colors.white,
  child: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(height: 10),
        const Text('Select Date for Session'),
        ElevatedButton(
          onPressed: () => _selectCheckInDate(context),
          child: const Text('Select Date'),
        ),
        const SizedBox(height: 10),
        if (selectedDate != null)
          Text(
            'Selected Date: ${DateFormat('dd.MM.yyyy').format(selectedDate!).toString()}',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => _selectTime(context, isStartTime: true),
          child: const Text('Select Start Time'),
        ),
        const SizedBox(height: 10),
        if (startTime != null)
          Text(
            'Start Time: ${startTime!.format(context)}',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => _selectTime(context, isStartTime: false),
          child: const Text('Select End Time'),
        ),
        const SizedBox(height: 10),
        if (endTime != null)
          Text(
            'End Time: ${endTime!.format(context)}',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
        if (startTime != null && endTime != null)
          Text(
            'Duration: ${calculateDuration(startTime!, endTime!, context).inMinutes} minutes',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            if (selectedDate != null && startTime != null && endTime != null) {
              print('Session booked for $selectedDate from ${startTime!.format(context)} to ${endTime!.format(context)}');
            }
          },
          child: const Text('Confirm Booking'),
        ),
      ],
    ),
  ),
);
    },
  );
}




          return 

          // show the list of psychos as a grid
          GridView.builder(
            itemCount: widget.psychosList.length,
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
                        backgroundImage: NetworkImage(widget.psychosList[index].imageUrl),
                      ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.psychosList[index].name,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      widget.psychosList[index].speciality,
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
                  widget.psychosList[index].rating.toString(),
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
                    // bookSession(widget.psychosList[index].uuid, context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MeetingScreen(),
                      ),
                    );
                  },
                  child: const Text('Start session'),
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
                        widget.psychosList[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.psychosList[index].name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.psychosList[index].speciality,
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