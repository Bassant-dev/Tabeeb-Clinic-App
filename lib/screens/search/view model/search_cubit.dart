import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../core/cache_helper.dart';
import '../../../core/dio_helper.dart';
import '../model/search model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  TextEditingController searchController=TextEditingController();
  List<SearchModel>searchResults=[];
  searchForDoctor()async
  {
    searchResults=[];
   try {
     Response response= await DioHelper.getData(url: 'doctor/doctor-search?name=${searchController.text}',token: CacheHelper.getData(key: "token"));
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
