import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_care_clinic/screens/home_screen/view_model/cubit/states.dart';
import 'package:v_care_clinic/screens/register_screen/view_model/cubit/states.dart';

import '../../../../core/cache_helper.dart';
import '../../../../core/dio_helper.dart';
import '../../model/home_model.dart';
import '../../view/widget/home_screen_body.dart';



class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  final Dio dio = Dio();


  // void addRegister(){
  //   emit(HomeLoadingState());
  //    DioHelper.getData(
  //     url: "/home/index",
  //     token: CacheHelper.getData(key: 'token')
  //   ).then((value) {
  //    print(value);
  //     emit(HomeSuccessState());
  //   }).catchError((errror){
  //     if(errror is DioException){
  //       print(errror.response);
  //     }
  //     print(errror);
  //     if(errror is DioError && errror.response?.statusCode==422){
  //       final e = errror.response?.data;
  //       final m = e["message"];
  //       print(e);
  //       print(m);
  //     }
  //     emit(HomeErrorState());
  //   });

 // }
  Autogenerated? autogenerated;
  Future<void>getAllDoctor()async
  {
    emit(HomeLoadingState());


    try {
      Response  data=await  DioHelper.getData(url: 'specialization/index',token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNjk1NDg5NzE2LCJleHAiOjE2OTU0OTMzMTYsIm5iZiI6MTY5NTQ4OTcxNiwianRpIjoiVVJzWDV5UUQ2N3lXYWRBRiIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.wa82sDNYmx4RJr5Q_1cexP6URuYepPV1qDa1D18rbUI");
      if(data.statusCode==200){

        autogenerated=Autogenerated.fromJson(data.data);
      }


      emit(HomeSuccessState());
    } on Exception catch (e)
    {
      if(e is DioError && e.response?.statusCode==401){
        final error = e.response?.data;
        final m = error["message"];
        print(error);
        print(m);
      }
      emit(HomeErrorState());
      print(e.toString());

    }


  }




}
