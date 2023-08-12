import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../style/style.dart';

class SearchScreens extends StatelessWidget {
  const SearchScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 2.h),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(80.sp, 60.sp),
              bottomRight: Radius.elliptical(80.sp, 60.sp),
            ),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 15.h,
                  decoration: BoxDecoration(
                    color: backgroundcolor,
                    boxShadow: [
                      BoxShadow(color: buttoncolor, blurRadius: 2.sp)
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(80.sp, 60.sp),
                      bottomRight: Radius.elliptical(80.sp, 60.sp),
                    ),
                  ),
                  child: Opacity(
                    opacity: 0.5,
                    child: Image.asset("images/search.png", fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(25.sp),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        focusColor: Colors.white,
                        hoverColor: Colors.white,
                        label: const Text("search"),
                        fillColor: const Color(0xFF17181B),
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(),
                        ),
                        prefixIcon: const Icon(
                          Icons.search_outlined,
                          color: Color(0xfff8d458),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xffeef1f4)),
                            borderRadius: BorderRadius.circular(25))),
                  ),
                )
              ],
            ),
          ),
        ),
      Expanded(
        flex: 1,
          child:  ListView.builder(
        scrollDirection: Axis.horizontal, // تحديد اتجاه التمرير بشكل أفقي
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.sp),
            child: Container(
              margin: EdgeInsets.all(5.sp),
              width: 25.w,
              height: 5.h,
              color: Colors.white30,

            ),
          );
        },
        itemCount: 5,
      )),
        Divider(color: buttoncolor,),
        Expanded(
          flex: 3,
          child: ListView.separated(
              itemBuilder: (context, index) => Container(

                    width: double.infinity,
                    height: 15.h,
                    color: Colors.white30,
                  ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: 4),
        ),
      ],
    );
  }
}
