import 'package:flutter/material.dart';
import 'package:moveisapp/core/chang_page/controle_page.dart';
import 'package:moveisapp/prestion/model/onbording_model.dart';
import 'package:moveisapp/prestion/widget/button_fc.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../style/style.dart';

class OnBordingView extends StatelessWidget {
  final OnBordingModel model;
  final PageController controlmovies;
   final int currentPage;
  const OnBordingView(
      {Key? key, required this.model, required this.controlmovies, required this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      height: 100.h,
      child: Stack(
        children: [
          SizedBox(
            width: 100.w,
            height: 100.h,
            child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  "${model.Image}",
                  fit: BoxFit.cover,
                )),
          ),
          Positioned(
              left: 27.w,
              top: 10.h,
              child: Text.rich(
                TextSpan(
                  text: 'M ',
                  style: TextStyle(
                      color: buttoncolor,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w800),
                  children: const <TextSpan>[
                    TextSpan(text: 'R ', style: TextStyle(color: Colors.white)),
                    TextSpan(
                        text: 'Movies', style: TextStyle(color: Colors.red)),
                  ],
                ),
              )),
          Positioned(
            top: 90.h,
              left: 40.w,
              child:  SmoothPageIndicator(
                controller: controlmovies,  // PageController
                count:3,
                textDirection: TextDirection.ltr,
                effect:  WormEffect(
                  dotColor: Colors.black,
                  activeDotColor: buttoncolor,

                ),
              ),),
          Positioned(
            top: 70.h,
            left: 15.w,
            child: Text.rich(
              TextSpan(
                text: 'The ',
                style: TextStyle(
                    color: buttoncolor,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w800),
                children: const <TextSpan>[
                  TextSpan(
                      text: 'Best ', style: TextStyle(color: Colors.white)),
                  TextSpan(text: 'Movies', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ),
          Positioned(
              top: 77.h,
              left: 5.w,
              child: SizedBox(
                  width: 90.w,
                  height: 30.h,
                  child: Text(
                    "${model.subject}",
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Colors.white.withOpacity(0.7)),
                  ))),
          Positioned(
            top:95.h,
              child: ButtonFc(
                onpres: (){
                  Navigator.pushNamed(context, RegisterScreens);
                },radius: 50.sp,Boxcolor: Colors.transparent.withOpacity(0.1),
                width: 10.w,child:const Text("Skip",style: TextStyle(color: Colors.white,fontSize: 15),),
              )),
          Positioned(
              top:95.h,
              left: 85.w,
              child: ButtonFc(
                onpres: (){
                  if (currentPage < 2) {
                    controlmovies.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  }else{
                    Navigator.pushNamed(context, RegisterScreens);
                  }
                },radius: 50.sp,Boxcolor: Colors.transparent.withOpacity(0.1),
                width: 10.w,child:const Text("Next",style: TextStyle(color: Colors.white,fontSize: 15),),
              ))
        ],
      ),
    );
  }
}
