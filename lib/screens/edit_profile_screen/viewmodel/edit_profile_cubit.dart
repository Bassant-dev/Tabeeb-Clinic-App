import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:v_care_clinic/core/Api.dart';
import 'package:v_care_clinic/core/cache_helper.dart';
import 'package:v_care_clinic/core/dio_helper.dart';
import 'package:v_care_clinic/screens/edit_profile_screen/models/UpdateUserModel.dart';


part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());
  final Dio dio=Dio();
  UpdateUserModel? editmodel;

  static EditProfileCubit get(context) => BlocProvider.of<EditProfileCubit>(context);

  void editprofile({required String name,required String email,required String phone,
     String? user_type, String? status}) {
    emit(EditProfileLoading());
    DioHelper.putData(
        url:"https://vcare.integration25.com/api/user/update/6",
        data: {
        'name':name,
        'email':email,
        'phone':phone,
        'user_type':"1",
        'status':"0"
        }
    ).then((value) {
      editmodel=UpdateUserModel.fromJson(value.data);
      print(value.data);
      Fluttertoast.showToast(
        msg: "Data Updated Successfully!",
        backgroundColor: Colors.green,
      );
      emit(EditProfileSuccess());

    }).catchError((errror){
      if(errror is DioException){
        print(errror.response);
      }
      print(errror);
      if(errror is DioError && errror.response?.statusCode==422){
        final e = errror.response?.data;
        final m = e["message"];
        print(e);
        print(m);
      }
      Fluttertoast.showToast(
        msg: errror.response!.statusMessage!,
        backgroundColor: Colors.red,
      );
      emit(EditProfileFailure());
    });

  }
}
