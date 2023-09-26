part of 'edit_profile_cubit.dart';

@immutable
abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}
class EditProfileLoading extends EditProfileState {}
class EditProfileSuccess extends EditProfileState {}
class EditProfileFailure extends EditProfileState {}
