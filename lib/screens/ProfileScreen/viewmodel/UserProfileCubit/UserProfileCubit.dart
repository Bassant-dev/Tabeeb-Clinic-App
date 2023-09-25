import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:v_care_clinic/core/Api.dart';
import 'package:v_care_clinic/core/cache_helper.dart';
import 'package:v_care_clinic/core/dio_helper.dart';
import 'package:v_care_clinic/screens/LoginScreen/models/SignUPModel/SignUpModel.dart';
import 'package:v_care_clinic/screens/LoginScreen/viewmodel/SignIncubit/SignInStates.dart';
import 'package:v_care_clinic/screens/ProfileScreen/models/AppointmentModel/Data.dart';
import 'package:v_care_clinic/screens/ProfileScreen/models/UserProfileModel/UserProfileModel.dart';
import 'package:v_care_clinic/screens/ProfileScreen/viewmodel/UserProfileCubit/UserProfileStates.dart';



class UserProfileCubit extends Cubit<UserProfileStates> {
  UserProfileCubit() : super(UserProfileInitialState());
  static UserProfileCubit get(context) => BlocProvider.of(context);


  UserProfileModel ? userprofileModel;
  List<AppointmentData> appointments = [];


  void GetUserData
      () {

    emit(UserProfileLoadingState());

    DioHelper.getData(url: ApiConst.USERPROFILE,
   token: CacheHelper.getData(key: "token")


    )
    .then((response) {
      userprofileModel = UserProfileModel.fromJson(response.data);
      print("in user profile  sucessssssss");

      print(response.data);

      emit(UserProfileSuccessState(userprofileModel!));
    }).catchError((error){
      print("Error in user profile");
      print(" ${error.toString()}");
      if (error is DioError) {
        if (error.response != null) {
          print(error.response!.data);
          print(error.response!.statusCode);
          print(error.response!.statusMessage);

          Map<String, dynamic> data = error.response!.data;

          Fluttertoast.showToast(
            msg: error.response!.statusMessage!,
            backgroundColor: Colors.red,
          );
          //  print(error.response!.headers);
        } else {
          print(error.requestOptions);
          print(error.message);
        }
      } else {
        print(error);
      }
      emit(UserProfileErrorState(error.toString()));
    });
  }
  void GetAppointments(

      )
  {

    emit(UserAppointmentLoadingState());

    DioHelper.getData(url: ApiConst.USERAPPOINTMENTS,
        token: CacheHelper.getData(key: "token")


    )
        .then((response) {
      print(response.data);
print(response.data['message']);

      for (var item in response.data['data'] ){
        try {
          print(item);
          appointments.add(AppointmentData.fromJson(item));
        } catch (e) {
          print( 'in catch error get all appointments ');
          appointments.add(AppointmentData.fromJson(item));
        }
      }
     /* print(appointments[0]);
      print(appointments[0].doctor);
      print(appointments[0].appointmentPrice);
      print(appointments[0].id);*/

      print("in user profile appointments  sucessssssss");


      emit(UserAppointmentSuccessState(appointments));
    }).catchError((error){
      print("Error in user profile appointments");
      print(" ${error.toString()}");
      if (error is DioError) {
        if (error.response != null) {
          print(error.response!.data);
          print(error.response!.statusCode);
          print(error.response!.statusMessage);

          Map<String, dynamic> data = error.response!.data;

          Fluttertoast.showToast(
            msg: error.response!.statusMessage!,
            backgroundColor: Colors.red,
          );
          //  print(error.response!.headers);
        } else {
          print(error.requestOptions);
          print(error.message);
        }
      } else {
        print(error);
      }
      emit(UserAppointmentErrorState(error.toString()));
    });
  }





}