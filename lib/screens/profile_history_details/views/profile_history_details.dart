import 'package:flutter/material.dart';
import 'package:v_care_clinic/core/appcolors.dart';
import 'package:v_care_clinic/core/appfont.dart';
import 'package:v_care_clinic/screens/ProfileScreen/models/AppointmentModel/Data.dart';
import 'package:v_care_clinic/screens/profile_history_details/views/widgets/profile_history_details_view_body.dart';


class ProfileHistoryDetailsView extends StatelessWidget {
//  const ProfileHistoryDetailsView({Key? key}) : super(key: key);
  const ProfileHistoryDetailsView(this.appointment);
  final AppointmentData ?appointment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: const Drawer(),
      appBar: AppBar(backgroundColor: AppColors.primaryColor,
          title: const Text(
            'VCare',
            style: Styles.textStyle20,
          )),
      body:  ProfileHistoryDetailsViewBody( appointment),
    );
  }
}