



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
class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
    );

    return BlocConsumer<UserProfileCubit, UserProfileStates>(
      listener: (BuildContext context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
            title: Text(
              'VCare',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'History',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: mainColor, // Use your main color here
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    height: 1,
                    width: 57,
                  ),
                  SizedBox(height: 20),
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: UserProfileCubit.get(context).appointments.length,
                    separatorBuilder: (context, index) => SizedBox(height: 16.0), // Add space here
                    itemBuilder: (context, index) => ListHistoryItem(UserProfileCubit.get(context).appointments[index], context),
                  )

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget ListHistoryItem(AppointmentData appointment, context) => GestureDetector(
  onTap: () {
    navto(context, ProfileHistoryDetailsView(appointment));
  },
  child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: mainColor,
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
              style: TextStyle(
                letterSpacing: 0.5,
                fontSize: 18,
                color: mainColor, // Use your main color here
              ),
            ),
          ),
          Spacer(),
          Text(
            appointment.status!,
            style: TextStyle(
              fontSize: 18,
              color: mainColor, // Use your main color here
            ),
          ),
        ],
      ),
    ),
  ),
);
