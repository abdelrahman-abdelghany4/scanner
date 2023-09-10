abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppAddLoadingState extends AppStates {}

class AppAddSuccessState extends AppStates {}

class AppAddErrorState extends AppStates {
  final String errorMag;

  AppAddErrorState(this.errorMag);
}
