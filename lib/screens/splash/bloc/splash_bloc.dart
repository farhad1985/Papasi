import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papasi/data/sql/profileDAL.dart';
import 'package:papasi/screens/splash/bloc/splash_event.dart';
import 'package:papasi/screens/splash/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(SplashState initialState) : super(initialState);

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is FetchSetting) {
      yield LoadingState();
      await Future.delayed(Duration(seconds: 3));

      final profile = await ProfileDAL.shared().getProfile();

      if (profile.token == null) {
        yield OnBoardingScreenState();
      } else {
        yield HomeState();
      }
    }
  }
}
