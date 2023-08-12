import 'package:flutter/material.dart';
import 'package:moveisapp/prestion/style/style.dart';
import 'package:moveisapp/prestion/view/onbording_view/onbording_view.dart';
import 'package:sizer/sizer.dart';

import '../../model/onbording_model.dart';

class OnBordingScreens extends StatefulWidget {
  const OnBordingScreens({Key? key}) : super(key: key);

  @override
  State<OnBordingScreens> createState() => _OnBordingScreensState();
}

class _OnBordingScreensState extends State<OnBordingScreens> {
  late final PageController _pageMovies=PageController();
  int _currentPageIndex = 0;
  List<OnBordingModel> onbordinglist=[
    OnBordingModel(title: " The Best Movies",Image: "images/on.jpg",subject: "It is an application that aims to display recent and distinguished movies and series to users. "),

    OnBordingModel(title: "The Best Movies",Image: "images/on2.jpg",subject: "The application is characterized by providing a variety of films and series of different genres and classifications, such as comedies, dramas, romantic films, and thriller and suspense series."),

    OnBordingModel(title: "The Best Movies",Image: "images/on3.jpg",subject: "With the latest movies and series, it enables users to search for movies and series in an easy and simple way. The application also provides detailed information about each movie or series, such as its story, the actors involved in it, previous user ratings, and available promotions and advertisements."),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      extendBody: true,

     body: Column(

       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         SizedBox(
           width: double.infinity,
           height: 100.h,
           child: PageView.builder(
               onPageChanged: (int index) {
                 setState(() {
                   _currentPageIndex = index;
                 });
               },
             controller: _pageMovies,
             itemCount: onbordinglist.length,
               itemBuilder: (context,index)=>OnBordingView(model: onbordinglist[index], controlmovies: _pageMovies, currentPage: _currentPageIndex,)),
         ),



       ],
     ),
    );
  }
}
