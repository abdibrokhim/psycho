import 'dart:async';
import 'package:psycho/screens/psycho/psycho_service.dart';
import 'package:psycho/screens/user/user_reducer.dart';
import 'package:psycho/screens/user/user_service.dart';
import 'package:psycho/store/app/app_store.dart';
import 'package:psycho/utils/error_reducer.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';


Stream<dynamic> fetchAllPsychosListEpic(Stream<dynamic> actions, EpicStore<GlobalState> store) {
  return actions
      .where((action) => action is FetchAllPsychosList)
      .asyncMap((action) => PsychoService.fetchPsychos())
      .flatMap<dynamic>((value) => Stream.fromIterable([
            FetchAllPsychosListResponse(value),
          ]))
      .onErrorResume((error, stackTrace) => Stream.fromIterable([
            HandleGenericErrorAction('Error while fetching fetchShopsWithDebts'),
          ]));
}


Stream<dynamic> fetchAllUpcomingSessionListEpic(Stream<dynamic> actions, EpicStore<GlobalState> store) {
  return actions
      .where((action) => action is FetchAllUpcomingSessionList)
      .asyncMap((action) => PsychoService.fetchSessions())
      .flatMap<dynamic>((value) => Stream.fromIterable([
            FetchAllUpcomingSessionListResponse(value),
          ]))
      .onErrorResume((error, stackTrace) => Stream.fromIterable([
            HandleGenericErrorAction('Error while fetching fetchDebtDetailsForShop'),
          ]));
}


Stream<dynamic> FetchAllTopResourcesListEpic(Stream<dynamic> actions, EpicStore<GlobalState> store) {
  return actions
      .where((action) => action is FetchAllTopResourcesList)
      .asyncMap((action) => PsychoService.fetchResources())
      .flatMap<dynamic>((value) => Stream.fromIterable([
            FetchAllTopResourcesListResponse(value),
          ]))
      .onErrorResume((error, stackTrace) => Stream.fromIterable([
            HandleGenericErrorAction('Error while fetching fetchDebtDetailsForShop'),
          ]));
}


List<Stream<dynamic> Function(Stream<dynamic>, EpicStore<GlobalState>)> userEffects = [
  fetchAllPsychosListEpic,
  fetchAllUpcomingSessionListEpic,
  FetchAllTopResourcesListEpic
];

