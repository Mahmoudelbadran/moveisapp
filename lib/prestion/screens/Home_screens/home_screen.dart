import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../bussines_logic/logic_home/home_logic.dart';
class HomeScreenApp extends StatefulWidget {
  const HomeScreenApp({Key? key}) : super(key: key);

  @override
  State<HomeScreenApp> createState() => _HomeScreenAppState();
}


class _HomeScreenAppState extends State<HomeScreenApp> {
   late final cubit = HomeLogic.get(context)..getMovies();
  int bottomNavIndex= 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLogic, Homestate>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          backgroundColor: const Color(0xFF17181B),
          drawer: const Drawer(),
          appBar: AppBar(

            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Padding(
              padding: EdgeInsets.only(left: 9.w),
              child: Row(
                children: [
                  SizedBox(
                    width: 12.w,
                    height: 7.h,
                    child: Image.asset(
                      "images/2.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                   Text(
                    cubit.label.elementAt(cubit.x),
                    style: const TextStyle(color: Color(0xffeef1f4)),
                  )
                ],
              ),
            ),
            centerTitle: true,
            actions: [
              InkWell(
                child: Padding(
                  padding: EdgeInsets.only(right: 3.w),
                  child: ClipOval(
                    clipBehavior: Clip.antiAlias,
                    child: CircleAvatar(
                      radius: 19.sp,
                      backgroundImage: const AssetImage("images/person.jpg"),
                    ),
                  ),
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: const Color(0xfff8d458),
            child: const Icon(Icons.videocam_outlined),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar(
            icons: cubit.iconList,
            backgroundColor: const Color(0xFF17181B),
            inactiveColor: const Color(0xffeef1f4),
            activeColor: const Color(0xfff8d458),
            elevation: 10,
            activeIndex: cubit.x,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.verySmoothEdge,
            leftCornerRadius: 32,
            rightCornerRadius: 32,
            onTap: (index) {
            cubit.changeclickebuton(index);
            },
            //other params
          ),
          body: cubit.changepages()
        );
      },
    );
  }
}
