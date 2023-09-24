import 'package:v_care_clinic/screens/LoginScreen/models/SignUPModel/SignUpModel.dart';

abstract class SignInStates {}

class SignInInitialState extends SignInStates {}

class SignInLoadingState extends SignInStates {}

class SignInSuccessState extends SignInStates
{
  final SignUpModel signinmodel;

  SignInSuccessState(this.signinmodel);
}
class SignInErrorState extends SignInStates
{
  final String error;

  SignInErrorState(this.error);
}
class keepsigninSelectionChangedState extends SignInStates{
  bool ?iskeepsigninSelected;
  keepsigninSelectionChangedState(this.iskeepsigninSelected);

}