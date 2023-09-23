import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_care_clinic/screens/register_screen/view_model/cubit/states.dart';

import '../../../../core/cache_helper.dart';
import '../../../../core/dio_helper.dart';
import '../../model/model_register.dart';
import '../../model/model_register.dart';



class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());


  final Dio dio = Dio();

  static RegisterCubit get(context) => BlocProvider.of<RegisterCubit>(context);
  RegisterModel? registerModel;
  SingupModel ? singupModel;
  void addRegister({required String name,required String email,required String phone,
    required String gender,required String password,required String ConfirmPassword}){
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: "auth/register",
      data: {
        'name':name,
        'email':email,
        'phone':phone,
        'gender':gender,
        'password':password,
        'password_confirmation':ConfirmPassword
      },

    ).then((value) {
      // singupModel=SingupModel.fromJson(value.data);
      print(value.data['data']['token']);
       CacheHelper.saveData(key:"token", value:value.data['data']['token']);
      print(CacheHelper.getData(key: 'token'));
      emit(RegisterSuccessState());
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
      emit(RegisterErrorState());
    });
  }




}
