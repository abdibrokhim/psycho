import 'package:psycho/screens/psycho/psycho_model.dart';
import 'package:redux/redux.dart';
import 'package:firebase_auth/firebase_auth.dart';



class UserState {
  final bool isLoading;
  final bool isPsychosListLoading;
  final bool isUpcomingSessionsListLoading;
  final bool isTopResourcesListLoading;
  final bool isLoggedIn;
  final String? accessToken;
  final String? refreshToken;
  final String message;
  final List<String?> errors;
  final User? user;
  final List<PsychoModel> psychosList;
  final List<UpcomingSessionModel> upcomingSessionsList;
  final List<TopResourceModel> topResourcesList;

  UserState({
    this.isLoading = false,
    this.isLoggedIn = false,
    this.accessToken = '',
    this.refreshToken = '',
    this.message = '',
    this.errors = const [],
    this.user,
    this.isPsychosListLoading = false,
    this.isUpcomingSessionsListLoading = false,
    this.isTopResourcesListLoading = false,
    this.psychosList = const [],
    this.upcomingSessionsList = const [],
    this.topResourcesList = const [],
  });

  UserState copyWith({
    bool? isLoading,
    bool? isLoggedIn,
    String? accessToken,
    String? refreshToken,
    String? message,
    List<String?>? errors,
    User? user,
    bool? isPsychosListLoading,
    bool? isUpcomingSessionsListLoading,
    bool? isTopResourcesListLoading,
    List<PsychoModel>? psychosList,
    List<UpcomingSessionModel>? upcomingSessionsList,
    List<TopResourceModel>? topResourcesList,
  }) {
    return UserState(
      isLoading: isLoading ?? this.isLoading,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      message: message ?? this.message,
      errors: errors ?? this.errors,
      user: user ?? this.user,
      isPsychosListLoading: isPsychosListLoading ?? this.isPsychosListLoading,
      isUpcomingSessionsListLoading: isUpcomingSessionsListLoading ?? this.isUpcomingSessionsListLoading,
      isTopResourcesListLoading: isTopResourcesListLoading ?? this.isTopResourcesListLoading,
      psychosList: psychosList ?? this.psychosList,
      upcomingSessionsList: upcomingSessionsList ?? this.upcomingSessionsList,
      topResourcesList: topResourcesList ?? this.topResourcesList,
    );
  }
}



// ========== SignInWithGoogle reducers ========== //


class SignInWithGoogle {
  SignInWithGoogle();
}

UserState signInWithGoogleReducer(UserState state, SignInWithGoogle action) {
  return state.copyWith(isLoading: true);
}

class SignInWithGoogleSuccessAction {
  final User user;

  SignInWithGoogleSuccessAction(
    this.user,
  );
}

UserState signInWithGoogleSuccessReducer(UserState state, SignInWithGoogleSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    isLoggedIn: true,
    user: action.user,
  );
}


// ========== FetchAllPsychosList reducers ========== //

class FetchAllPsychosList {
  FetchAllPsychosList();
}

UserState fetchAllPsychosListReducer(UserState state, FetchAllPsychosList action) {
  return state.copyWith(isPsychosListLoading: true);
}

class FetchAllPsychosListResponse {
  final List<PsychoModel> psychosList;

  FetchAllPsychosListResponse(
    this.psychosList,
  );
}


UserState fetchAllPsychosListResponseReducer(UserState state, FetchAllPsychosListResponse action) {
  return state.copyWith(
    isPsychosListLoading: false,
    psychosList: action.psychosList,
  );
}

// ========== FetchAllUpcomingSessionList reducers ========== //

class FetchAllUpcomingSessionList {
  FetchAllUpcomingSessionList();
}

UserState fetchAllUpcomingSessionListReducer(UserState state, FetchAllUpcomingSessionList action) {
  return state.copyWith(isUpcomingSessionsListLoading: true);
}

class FetchAllUpcomingSessionListResponse {
  final List<UpcomingSessionModel> upcomingSessionsList;

  FetchAllUpcomingSessionListResponse(
    this.upcomingSessionsList,
  );
}

UserState fetchAllUpcomingSessionListResponseReducer(UserState state, FetchAllUpcomingSessionListResponse action) {
  return state.copyWith(
    isUpcomingSessionsListLoading: false,
    upcomingSessionsList: action.upcomingSessionsList,
  );
}

// ========== FetchAllTopResourcesList reducers ========== //


class FetchAllTopResourcesList {
  FetchAllTopResourcesList();
}

UserState fetchAllTopResourcesListReducer(UserState state, FetchAllTopResourcesList action) {
  return state.copyWith(isTopResourcesListLoading: true);
}

class FetchAllTopResourcesListResponse {
  final List<TopResourceModel> topResourcesList;

  FetchAllTopResourcesListResponse(
    this.topResourcesList,
  );
}

UserState fetchAllTopResourcesListResponseReducer(UserState state, FetchAllTopResourcesListResponse action) {
  return state.copyWith(
    isTopResourcesListLoading: false,
    topResourcesList: action.topResourcesList,
  );
}



// ========== Combine all reducers ========== //

Reducer<UserState> userReducer = combineReducers<UserState>([
  TypedReducer<UserState, SignInWithGoogle>(signInWithGoogleReducer),
  TypedReducer<UserState, SignInWithGoogleSuccessAction>(signInWithGoogleSuccessReducer),
  TypedReducer<UserState, FetchAllPsychosList>(fetchAllPsychosListReducer),
  TypedReducer<UserState, FetchAllPsychosListResponse>(fetchAllPsychosListResponseReducer),
  TypedReducer<UserState, FetchAllUpcomingSessionList>(fetchAllUpcomingSessionListReducer),
  TypedReducer<UserState, FetchAllUpcomingSessionListResponse>(fetchAllUpcomingSessionListResponseReducer),
  TypedReducer<UserState, FetchAllTopResourcesList>(fetchAllTopResourcesListReducer),
  TypedReducer<UserState, FetchAllTopResourcesListResponse>(fetchAllTopResourcesListResponseReducer),
]);