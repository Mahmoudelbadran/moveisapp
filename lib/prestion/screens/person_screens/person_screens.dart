import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moveisapp/bussines_logic/logic_home/home_logic.dart';
import 'package:moveisapp/core/chang_page/controle_page.dart';
import 'package:sizer/sizer.dart';

class PersonScreens extends StatelessWidget {
  const PersonScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController namecontroler = TextEditingController();
    final user = FirebaseAuth.instance.currentUser;
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            SizedBox(
              width: double.infinity,
              height: 27.h,
              child: Stack(
                children: [

                  Positioned(
                      top: 10.h,
                      left: 33.w,
                      child: CircleAvatar(
                        radius: 50.sp,
                        backgroundColor: Colors.white,
                        backgroundImage: const AssetImage("images/person.jpg"),
                      )),
                  Positioned(
                      top: 20.h,
                      left: 56.w,
                      child: FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        child: const Icon(Icons.add_a_photo),
                      )),

                ],
              ),
            ),
            Container(
                padding: EdgeInsets.all(20.sp),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: namecontroler,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            focusColor: Colors.white,
                            hoverColor: Colors.white,
                            label: const Text("UserName"),
                            hintText: "Mahmoudbdaran",
                            hintStyle: const TextStyle(color: Colors.white),
                            fillColor: const Color(0xFF17181B),
                            labelStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(),
                            ),
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Color(0xfff8d458),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Color(0xffeef1f4)),
                                borderRadius: BorderRadius.circular(25))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              focusColor: Colors.white,
                              hoverColor: Colors.white,
                              label: const Text("Number Phone"),
                              hintText: "1033093103",
                              hintStyle: const TextStyle(color: Colors.white),
                              fillColor: const Color(0xFF17181B),
                              labelStyle: const TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: const BorderSide(),
                              ),
                              prefixIcon: const CountryCodePicker(
                                onChanged: print,
                                initialSelection: 'EG',
                                favorite: ['+20', 'EG'],
                                showCountryOnly: false,
                                showOnlyCountryWhenClosed: false,
                                alignLeft: false,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xffeef1f4)),
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              focusColor: Colors.white,
                              hoverColor: Colors.white,
                              label: const Text("Email"),
                              hintText: user?.email,
                              hintStyle: const TextStyle(color: Colors.white),
                              fillColor: const Color(0xFF17181B),
                              labelStyle: const TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: const BorderSide(),
                              ),
                              prefixIcon: const Icon(Icons.email_outlined,
                                  color: Color(0xfff8d458)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xffeef1f4)),
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.sp),
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.only(
                                    left: 20.sp,
                                    right: 20.sp,
                                  ),

                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(50.sp)),
                                  side: BorderSide(
                                      color: const Color(0xfff8d458),
                                      width: 1.sp)),
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    fontSize: 13.sp, color: Colors.white),
                              ),
                            ),
                          ),
                          BlocBuilder<HomeLogic, Homestate>(
                            builder: (context, state) {
                              return OutlinedButton(
                                onPressed: () {
                                  FirebaseAuth.instance.signOut();
                                },
                                style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.only(
                                      left: 20.sp,
                                      right: 20.sp,
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            50.sp)),
                                    side: BorderSide(
                                        color: Colors.redAccent, width: 1.sp)),
                                child: Text(
                                  "SignOut",
                                  style: TextStyle(
                                      fontSize: 13.sp, color: Colors.white),
                                ),
                              );
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}
