import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moveisapp/bussines_logic/logic_home/home_logic.dart';
import 'package:moveisapp/prestion/style/style.dart';

import 'package:moveisapp/prestion/view/preumumn_screens/periesmi_view.dart';
import 'package:moveisapp/prestion/view/rondom_screen/rondom_view.dart';
import 'package:sizer/sizer.dart';

import '../news_screens/new_view.dart';
import '../popular_ithem/popular_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLogic, Homestate>(
      builder: (context, state) {
        if (state is LoadingApiAppState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SuscessApiAppState ||
            state is changeclickebutonstates) {
          return DefaultTabController(
            length: 4,
            child: ListView(
              children: [
                Container(
                  width: 7.w,
                  height: 12.h,
                  padding: EdgeInsets.all(6.w),
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
                ),
                const TabBar(indicatorColor: Color(0xfff8d458), tabs: [
                  Tab(
                    text: "Popular",
                  ),
                  Tab(
                    text: "News",
                  ),
                  Tab(
                    text: "Stars",
                  ),
                  Tab(
                    text: "Random",
                  ),
                ]),
                SizedBox(
                  height: MediaQuery.of(context).size.height -
                      kToolbarHeight -
                      kBottomNavigationBarHeight -
                      12.h,
                  child: Stack(children:  const [
                    TabBarView(children: [
                      PopularView(),
                      NewView(),
                      PersonView(),
                      RondomView()
                    ])
                  ]),
                )
              ],
            ),
          );
        } else if (state is ErorrApiAppState) {
          return AlertDialog(
            title: Text(
              "Woring!",
              style: TextStyle(fontWeight: FontWeight.w800, color: buttoncolor),
            ),
            backgroundColor: backgroundcolor,
            content: const Text("The internet is not Working",
                style: TextStyle(
                    fontWeight: FontWeight.w800, color: Colors.redAccent)),
            scrollable: true,
          );
        } else {
          return AlertDialog(
            title: Text(
              "Woring!",
              style: TextStyle(fontWeight: FontWeight.w800, color: buttoncolor),
            ),
            backgroundColor: backgroundcolor,
            content: const Text("Erorr404",
                style: TextStyle(
                    fontWeight: FontWeight.w800, color: Colors.redAccent)),
            scrollable: true,
          );
        }
      },
    );
  }
}
