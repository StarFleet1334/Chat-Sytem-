
import 'package:chatty/common/style/color.dart';
import 'package:chatty/common/values/values.dart';
import 'package:chatty/pages/frame/signin/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';




class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: 100.h,bottom: 80.h),
      child: Text(
        "Chat in the KIU",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontWeight: FontWeight.bold,
          fontSize: 34.sp
        ),
      ),
    );
  }

  Widget _buildThirdPartyLogin(String loginType,String assetType) {
    return GestureDetector(
      child: Container(
        width: 295.w,
        height: 44.h,
        padding: EdgeInsets.all(10.h),
        margin: EdgeInsets.only(bottom: 15.h),
        decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0,1)
              )
            ]
        ),
        child: Row(
          mainAxisAlignment:  assetType == "" ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            assetType == "" ? Container() :
            Container(
              padding: EdgeInsets.only(left: 40.w,right: 30.w),
              child: Image.asset("assets/icons/$assetType.png"),

            ),
            Text(
              "Sign in with $loginType",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp
              ),

            )
          ],
        ),
      ),
      onTap: () {
        controller.handleSignIn("google");
      },
    );
  }

  Widget _buildOr() {
    return Container(
      margin: EdgeInsets.only(top: 20.h,bottom: 35.h),
      child: Row(
        children: [
          Expanded(child: Divider(
            indent: 50,
            height: 2.h,
            color: AppColors.primarySecondaryElementText,
          )),
          const Text(" or "),
          Expanded(child: Divider(
            endIndent: 50,
            height: 2.h,
            color: AppColors.primarySecondaryElementText,
          ))
        ],
      ),
    );
  }

  Widget _buildSignUp() {
    return GestureDetector(
      child: Column(
        children: [
          Text(
              "Already have an account",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp
              )
          ),
          GestureDetector(
              child: Text(
                  "sign up here",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.primaryElement,
                      fontWeight: FontWeight.normal,
                      fontSize: 12.sp
                  )
              )
          )
        ],
      ),
      onTap: () {
        print("...sign up here");
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarySecondaryBackground,
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            _buildThirdPartyLogin("Google","google"),
            _buildThirdPartyLogin("Facebook","facebook"),
            _buildThirdPartyLogin("Apple","apple"),
            _buildOr(),
            _buildThirdPartyLogin("phone number",""),
            SizedBox(height: 30.h,),
            _buildSignUp()
          ],
        ),
      ),
    );
  }
}
