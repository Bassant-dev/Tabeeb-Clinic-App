import 'package:flutter/material.dart';
import 'package:vcareapp/core/appcolors/colors.dart';
import 'package:vcareapp/features/profile_history_details/views/widgets/profile_history_details_view_body.dart';

import '../../../core/appfont/styles.dart';

class ProfileHistoryDetailsView extends StatelessWidget {
  const ProfileHistoryDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: const Drawer(),
      appBar: AppBar(backgroundColor: AppColors.primaryColor,
          title: const Text(
        'VCare',
        style: Styles.textStyle20,
      )),
      body: const ProfileHistoryDetailsViewBody(),
    );
  }
}
