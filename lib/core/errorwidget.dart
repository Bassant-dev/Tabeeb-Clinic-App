
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          errorMessage,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            // textAlign: TextAlign.center,
          ),
        ));
  }
}