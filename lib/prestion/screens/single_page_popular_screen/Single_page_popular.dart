import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moveisapp/bussines_logic/logic_home/home_logic.dart';
import 'package:moveisapp/data/Remote/Response/Movies_popular_response.dart';
import 'package:moveisapp/prestion/style/style.dart';
import 'package:sizer/sizer.dart';

import '../../widget/defoult_image.dart';

class SinglePagePopular extends StatelessWidget {
  final MoviesResults modeldata;
  const SinglePagePopular({Key? key, required this.modeldata})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLogic, Homestate>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          backgroundColor: backgroundcolor,
          appBar: AppBar(
            backgroundColor: Colors.transparent.withOpacity(0.5),
            elevation: 0,
            title: Text(modeldata.title),
            titleTextStyle: TextStyle(color: buttoncolor, fontSize: 15.sp),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.elliptical(100.sp, 30.sp),
                          bottomLeft: Radius.elliptical(100.sp, 30.sp)),
                      child: SizedBox(
                        width: double.infinity,
                        height: 60.h,
                        child: DefaultNetworkImage(
                          imageURL: HomeLogic.get(context)
                              .imageURL(imagePath: modeldata.backdropPath),
                          fit: BoxFit.fill,
                          width: 50.w,
                        ),
                      ),
                    ),
                    Positioned(
                        top: 52.h,
                        left: 7.w,
                        child: CircleAvatar(
                          backgroundColor: buttoncolor,
                          radius: 25.sp,
                          child: Icon(
                            Icons.play_arrow_outlined,
                            color: Colors.white,
                            size: 35.sp,
                          ),
                        ))
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 2.h, left: 6.w,right: 6.w,bottom: 2.h),
                  child: Text(modeldata.overview,maxLines: 4,style: TextStyle(fontSize: 12.sp,color: Colors.white),),
                ),
                Padding(
                  padding:  EdgeInsets.all(2.sp),
                  child: Text("The Start Date:  ${modeldata.releaseDate}",style: TextStyle(fontSize: 12.sp,color: Colors.white,letterSpacing: 2.sp),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Icon(Icons.star,color: buttoncolor,),
                    Icon(Icons.star,color: buttoncolor,),
                    Icon(Icons.star,color: buttoncolor,),
                    Icon(Icons.star,color: buttoncolor,),
                    Icon(Icons.star,color: buttoncolor,),
                ],)

              ],
            ),
          ),
        );
      },
    );
  }
}
