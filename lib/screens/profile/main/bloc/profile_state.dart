part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class InitialState extends ProfileState {}

class LoadingState extends ProfileState {}

class ProfileStatus extends ProfileState {
  final User user;

  ProfileStatus({this.user});
}

class GuestStatus extends ProfileState {}
