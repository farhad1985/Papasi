import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papasi/data/api/account/account_service.dart';
import 'package:papasi/data/sql/profileDAL.dart';
import 'package:papasi/domain/model/response/registeration/user.dart';
import 'package:papasi/domain/usecase/api/account.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(InitialState());

  IAccountService accountService = AccountService();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is FetchProfileEvent) {
      final profile = await ProfileDAL.shared().getProfile();

      if (profile.isGuest) {
        yield GuestStatus();
      } else {
        yield LoadingState();
        final user = await _fetchUser();
        yield ProfileStatus(user: user);
      }
    }
  }

  Future<User> _fetchUser() async {
    return accountService.fetchProfile();
  }
}
