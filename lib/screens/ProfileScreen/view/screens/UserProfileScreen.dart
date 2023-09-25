



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:v_care_clinic/core/Colors.dart';
import 'package:v_care_clinic/core/SharedFunctions.dart';
import 'package:v_care_clinic/core/errorwidget.dart';
import 'package:v_care_clinic/core/loadingWidget.dart';
import 'package:v_care_clinic/screens/ProfileScreen/models/AppointmentModel/Data.dart';
import 'package:v_care_clinic/screens/ProfileScreen/viewmodel/UserProfileCubit/UserProfileCubit.dart';
import 'package:v_care_clinic/screens/ProfileScreen/viewmodel/UserProfileCubit/UserProfileStates.dart';
import 'package:v_care_clinic/screens/profile_history_details/views/profile_history_details.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,);

    return BlocConsumer<UserProfileCubit,UserProfileStates>(
      listener: (BuildContext context, state) {



        if (state is UserProfileSuccessState  ) {
          print("get user data doneeeeeeee");

          print( state.userprofilemodel.message);
          Fluttertoast.showToast(
            msg: "Successfully show user data",
            backgroundColor: Colors.green,
          );



        }
        if (state is  UserAppointmentSuccessState ) {
          print("get Appointments doneeeeeeee");

          print( state.appointments.length);
          Fluttertoast.showToast(
            msg: "Successfully show Appointments ",
            backgroundColor: Colors.green,
          );



        }

      },
        builder: (context,state) {
         // if (state is UserProfileSuccessState  ) {


    return Scaffold(

    appBar: AppBar(
    backgroundColor: mainColor,
    title: Text('VCare'),
    // actions:[Icon(Icons.menu)],
    ),
    body: SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,

    children: [
    SizedBox(
    height: 20.h,
    ),

    Icon(Icons.person),
    SizedBox(
    height: 10.h,
    ),


    Text(
    UserProfileCubit.get(context).userprofileModel!.data![0].name??'username',
    style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    ),
    ),
    SizedBox(
    height: 5.h,
    ),

    Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text('Edit acount details',
    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    /*   color: Color(0xFF030E19B2
                     ).withOpacity(0.7),*/
    color: Colors.grey,
    ),


    ),
    SizedBox(
    width: 5.h,
    ),
    Icon(Icons.edit,
    color:Colors.grey,
    ),


    ]),
    SizedBox(
    height: 20.h,
    ),

    Divider(
    // color: Color(0xFF030E19B2),
    ),
    SizedBox(
    height: 20.h,
    ),


    Row(children: [
    Icon(Icons.email),
    SizedBox(width: 10.w,),
    Text(    UserProfileCubit.get(context).userprofileModel!.data![0].email??'email',


    ),


    ]),
    SizedBox(
    height: 20.h,
    ),

    Row(children: [
    Icon(Icons.phone),
    SizedBox(width: 10.w,),

    Text(    UserProfileCubit.get(context).userprofileModel!.data![0].phone??'user phone',
    ),


    ]),
    SizedBox(
    height: 20.h,
    ),

    Row(children: [
    Icon(Icons.lock),
    SizedBox(width: 10.w,),

    Text('password'),
    SizedBox(width: 10.w,),

    Icon(Icons.remove_red_eye_outlined),


    ]),
    SizedBox(
    height: 20.h,
    ),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,

    children: [

    Padding(
    padding: const EdgeInsets.all(10.0),
    child: Text('History',


    ),
    ),

    Container(
    color: Colors.black,
    height: 1,
    width:57
    ),
    SizedBox(
    height: 20.h,
    ),

    //  Divider(),
    ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: UserProfileCubit.get(context).appointments.length,
    itemBuilder: (context, index) =>ListHistoryItem( UserProfileCubit.get(context).appointments[index],context)
    )
    ]
    ),
    ],
    ),
    ),
    ),
    );




  }
    );

  }

}
Widget ListHistoryItem(AppointmentData appointment ,context)=>
    Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),


        child: SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: GestureDetector(
            onTap: () {
navto(context,ProfileHistoryDetailsView(appointment));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color:mainColor,
                  width: 2.0,
                ),

              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),

                  child: Row(
                    children: [
                      Flexible(

                        child: Text(
                            appointment.appointmentTime!,
                               style:TextStyle(
                                 letterSpacing: 0.5,


                               ) ,

                        ),
                      ),
                      Spacer(),
                      Text(appointment.status!),

                    ],
                  ),
                ),
              ),

          ),
        ),
      ),
    );
