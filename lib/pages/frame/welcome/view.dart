import 'package:chatty/common/style/color.dart';
import 'package:chatty/pages/frame/welcome/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});


  Widget _buildPageTitle(String title) {
    return Container(
      margin: const EdgeInsets.only(top: 350),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style:  TextStyle(
          color: AppColor.primaryText,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.bold,
          fontSize: 45.sp
        ),
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryBackground,
      body: Container(
        width: 360.w,
        height: 780.h,
        child: _buildPageTitle(controller.title),
      ),
    );
  }
}
