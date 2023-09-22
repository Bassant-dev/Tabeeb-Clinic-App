
abstract class RegisterStates {}
class RegisterInitialState extends  RegisterStates{}
class RegisterLoadingState extends   RegisterStates{}
class RegisterSuccessState extends   RegisterStates
{
  String? token;
  RegisterSuccessState(this.token);

}
class RegisterErrorState extends   RegisterStates
{
}
