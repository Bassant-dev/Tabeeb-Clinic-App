import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../core/cache_helper.dart';
import '../../../core/dio_helper.dart';
import '../model/doctor details model.dart';
part 'doctor_details_state.dart';

class DoctorDetailsCubit extends Cubit<DoctorDetailsState> {
  DoctorDetailsCubit() : super(DoctorDetailsInitial());
  DoctorDetailsModel ?model;
  DateTime ? dateTime;
  TextEditingController dateTimeController=TextEditingController();
  changeDateTime(newDate)
  {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final formattedDate = formatter.format(newDate);
    dateTimeController.text=formattedDate;
    print(formattedDate);
    emit(DateTimeChangedSuccess());
  }
 Future showDetails( int ? doctorId)async// put doctorId here
  {

   emit(DoctorDetailsLoading());
   try {

      Response response=await DioHelper.getData(
       url: 'doctor/show/$doctorId',
        token:  CacheHelper.getData(key: "token")
      );
model=DoctorDetailsModel.fromJson(response.data);
     print(DoctorDetailsModel.fromJson(response.data));
      print(response.data['message']);
      getTime();
      emit(DoctorDetailsShowSuccess());
    } on Exception catch (e) {
      if(e is DioException)
        {
          print(e.response?.data);
        }
      print(e.toString());
      emit(DoctorDetailsShowFailure());
    }

  }

 List<String>time=[];
  getTime()
  {
    time=[];
    String date="";
      for(int x=int.parse(model!.doctorDataModel.start_time.substring(0,2));
      x<=int.parse(model!.doctorDataModel.end_time.substring(0,2));x++)
        {

          if(x>12 && x<24){
            date="PM";
          }else{
            date="AM";
          }
          time.add("$x $date");
          //timeChecked.add(false);
        }

      print(time.length);
  }

int currentIndex=0;
  changeIndex(int index)
  {
    currentIndex=index;
    emit(TimeChangedSuccess());
  }


}
