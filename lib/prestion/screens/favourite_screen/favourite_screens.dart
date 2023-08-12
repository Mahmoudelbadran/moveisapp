import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../style/style.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        Padding(
          padding:  EdgeInsets.only(bottom: 2.h),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(120.sp, 60.sp),
              bottomRight: Radius.elliptical(120.sp, 60.sp),
            ),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: backgroundcolor,
                    boxShadow: [BoxShadow(color: buttoncolor, blurRadius: 2.sp)],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(100.sp, 60.sp),
                      bottomRight: Radius.elliptical(100.sp, 60.sp),
                    ),
                  ),
                  child: Opacity(
                    opacity: 0.5,
                    child: Image.asset("images/favo.jpg", fit: BoxFit.fill),
                  ),
                ),
                Positioned(
                    left: 15.w,
                    top: 13.h,
                    child: Text(
                      "The Best Movies",
                      style: TextStyle(
                          fontSize: 25.sp,
                          color: buttoncolor,
                          fontWeight: FontWeight.w800),
                    ))
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => Container(width: double.infinity,height: 15.h,color: Colors.black,),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: 4),
        ),
      ],
    );
  }
}
