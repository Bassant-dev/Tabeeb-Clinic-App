import 'package:v_care_clinic/screens/LoginScreen/models/SignUPModel/SignUpModel.dart';
import 'package:v_care_clinic/screens/ProfileScreen/models/AppointmentModel/Data.dart';
import 'package:v_care_clinic/screens/ProfileScreen/models/UserProfileModel/UserProfileModel.dart';

abstract class UserProfileStates {}

class UserProfileInitialState extends UserProfileStates {}
///get user data states
class UserProfileLoadingState extends UserProfileStates {}

class UserProfileSuccessState extends UserProfileStates
{
  final UserProfileModel userprofilemodel;

  UserProfileSuccessState(this.userprofilemodel);
}
class UserProfileErrorState extends UserProfileStates
{
  final String error;

  UserProfileErrorState(this.error);
}
//get user appointments states
class UserAppointmentLoadingState extends UserProfileStates {}

class UserAppointmentSuccessState extends UserProfileStates
{
  final List<AppointmentData>  appointments;

  UserAppointmentSuccessState(this.appointments);
}
class UserAppointmentErrorState extends UserProfileStates
{
  final String error;

  UserAppointmentErrorState(this.error);
}