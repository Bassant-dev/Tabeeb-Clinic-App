import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_care_clinic/screens/register_screen/view_model/cubit/states.dart';



class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());


  final Dio dio = Dio();

  static RegisterCubit get(context) => BlocProvider.of<RegisterCubit>(context);

 // LoginModel? loginModel;


}
