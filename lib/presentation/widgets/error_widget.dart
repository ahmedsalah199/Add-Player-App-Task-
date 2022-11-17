import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:players/core/utils/app_font.dart';
import 'package:players/core/utils/app_strings.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_value.dart';

class ErrorWidgetScreen extends StatelessWidget {
  final VoidCallback? onPress;
  final String? errorMessage;
  const ErrorWidgetScreen({Key? key, this.onPress, this.errorMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.warning_amber_rounded, size: AppSize.s150),
          Container(
            margin: const EdgeInsets.symmetric(vertical: AppMargin.m15),
            child: Text(
              errorMessage!,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: AppFontSize.s20,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Text(
            AppStrings.pleaseTryAgain,
            style: TextStyle(
                color: Colors.grey[AppSize.s400.toInt()],
                fontSize: AppFontSize.s18,
                fontWeight: FontWeight.bold),
          ),
          Container(
              height: AppSize.s55.h,
              width: AppSize.s200.w,
              margin: const EdgeInsets.symmetric(vertical: AppMargin.m10),
              child: ElevatedButton(
                onPressed: () {
                  if (onPress != null) {
                    onPress!();
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    elevation: AppSize.s5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s50.r))),
                child: Text(
                  AppStrings.reloadScreen,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: AppFontSize.s20,
                      fontWeight: FontWeight.bold),
                ),
              )),
        ],
      ),
    );
  }
}
