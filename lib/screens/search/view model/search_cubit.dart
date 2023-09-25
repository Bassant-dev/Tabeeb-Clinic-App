import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:vcareapp/core/diohelper/dio.dart';
import 'package:vcareapp/features/search/model/search%20model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  TextEditingController searchController=TextEditingController();
  List<SearchModel>searchResults=[];
  searchForDoctor()async
  {
    searchResults=[];
   try {
     Response response= await DioHelper.getData(endPoint: '/doctor/doctor-search?name=${searchController.text}');
       print(response.data['message']);
     response.data['data'].forEach((item){
       searchResults.add(SearchModel.fromJson(item));
     });
     emit(SearchSuccess());
   } on Exception catch (e) {
     if(e  is DioException)
       {
         print(e.response?.data);
       }
     emit(SearchFailure());
   }

  }
}
