import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:moveisapp/bussines_logic/logic_home/home_logic.dart';
import 'package:sizer/sizer.dart';
import '../../../core/chang_page/controle_page.dart' as screens;
import '../../style/style.dart';
import '../../widget/button_fc.dart';

class RegisterScreens extends StatefulWidget {
  const RegisterScreens({Key? key}) : super(key: key);

  @override
  State<RegisterScreens> createState() => _RegisterScreensState();

}


class _RegisterScreensState extends State<RegisterScreens> {
  TextEditingController email = TextEditingController();
  TextEditingController passwword = TextEditingController();
  TextEditingController passwwordconfri = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();
  late final cubit = HomeLogic.get(context);
  bool ishidden=true;
  IconData SurfixIcon=Icons.visibility;
  void clickeye(){
    setState(() {
      if(ishidden){
        SurfixIcon=Icons.visibility_off;

      }else{
        SurfixIcon=Icons.visibility;
      }
      ishidden=!ishidden;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLogic, Homestate>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          backgroundColor: Colors.black,
          body: SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 100.h,
                      child: Opacity(
                        opacity: 0.3,
                        child: Image.asset(
                          "images/back.gif",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        padding: EdgeInsets.all(20.sp),
                        margin: EdgeInsets.only(top: 2.h),
                        width: double.infinity,
                        height: 100.h,
                        child: Form(
                          key: key,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: EdgeInsets.all(20.sp),
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: AssetImage("images/sig.gif"),
                                    radius: 80,
                                  )),
                              Padding(
                                padding: EdgeInsets.all(10.sp),
                                child: Text(
                                  "Welcome,MR Movies.",
                                  style:
                                      TextStyle(fontSize: 20, color: buttoncolor),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                                child: TextFormField(
                                  validator:  (Text) {
                                    if (Text!.isEmpty) {
                                      return 'Email can\'t Empty';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: email,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      hoverColor: Colors.white,
                                      label: const Text("Email"),
                                      hintStyle:
                                          const TextStyle(color: Colors.white),
                                      fillColor: const Color(0xFF17181B),
                                      labelStyle:
                                          const TextStyle(color: Colors.white),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                        borderSide: const BorderSide(),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                        borderSide: const BorderSide(
                                            color: Colors
                                                .grey), // لون الحدود عندما يكون غير نشط
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                        borderSide: const BorderSide(
                                            color: Colors
                                                .grey), // لون الحدود عندما يكون غير نشط
                                      ),
                                      prefixIcon: const Icon(Icons.email_outlined,
                                          color: Color(0xfff8d458)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xffeef1f4)),
                                          borderRadius:
                                              BorderRadius.circular(25))),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 2.h),
                                child: TextFormField(
                                  validator: (Text) {
                                    if (Text!.isEmpty) {
                                      return 'Password can\'t Empty';
                                    } else if(Text.length<6) {
                                      return "يجب وضع اكثر من 6ارقام هنا";
                                    }
                                    return null;

                                  },
                                  controller: passwword,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(onPressed: ()=>clickeye(),icon:Icon(
                                        SurfixIcon,
                                        color: buttoncolor,
                                      ),),
                                      focusColor: Colors.white,
                                      hoverColor: Colors.white,
                                      label: const Text("Password"),
                                      hintStyle:
                                          const TextStyle(color: Colors.white),
                                      fillColor: const Color(0xFF17181B),
                                      labelStyle:
                                          const TextStyle(color: Colors.white),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                        borderSide: const BorderSide(),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                        borderSide: const BorderSide(
                                            color: Colors
                                                .grey), // لون الحدود عندما يكون غير نشط
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                        borderSide: const BorderSide(
                                            color: Colors
                                                .grey), // لون الحدود عندما يكون غير نشط
                                      ),
                                      prefixIcon: const Icon(Icons.key,
                                          color: Color(0xfff8d458)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xffeef1f4)),
                                          borderRadius:
                                              BorderRadius.circular(25))),
                                  style: const TextStyle(color: Colors.white),
                                  obscureText: ishidden,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 2.h),
                                child: TextFormField(
                                  validator:(Text) {
                                    if (Text!.isEmpty) {
                                      return 'Password can\'t Empty';
                                    } else if(Text.length<6) {
                                      return "يجب وضع اكثر من 6ارقام هنا";
                                    }
                                    return null;

                                  },
                                  controller: passwwordconfri,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(onPressed: ()=>clickeye(),icon:Icon(
                                        SurfixIcon,
                                        color: buttoncolor,
                                      ),),
                                      focusColor: Colors.white,
                                      hoverColor: Colors.white,
                                      label: const Text("Confirm Password"),
                                      hintStyle:
                                          const TextStyle(color: Colors.white),
                                      fillColor: const Color(0xFF17181B),
                                      labelStyle:
                                          const TextStyle(color: Colors.white),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                        borderSide: const BorderSide(),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                        borderSide: const BorderSide(
                                            color: Colors
                                                .grey), // لون الحدود عندما يكون غير نشط
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                        borderSide: const BorderSide(
                                            color: Colors
                                                .grey), // لون الحدود عندما يكون غير نشط
                                      ),
                                      prefixIcon: const Icon(Icons.key,
                                          color: Color(0xfff8d458)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xffeef1f4)),
                                          borderRadius:
                                              BorderRadius.circular(25))),
                                  style: const TextStyle(color: Colors.white),
                                  obscureText:ishidden ,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 2.h),
                                child: Row(
                                  children: [
                                    const Text(
                                      "if you can account ,",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            screens.LoginScreens,
                                            (route) => false);
                                      },
                                      child: const Text(
                                        "Here.",
                                        style: TextStyle(color: Colors.blueGrey),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              BlocBuilder<HomeLogic, Homestate>(
                                builder: (context, state) {
                                  return ButtonFc(
                                    onpres: () {
                                      if(key.currentState!.validate()){
                                        cubit.signUp(
                                            Email: email.text.trim(),
                                            password: passwword.text.trim(),
                                            passwordconfirm:
                                            passwwordconfri.text.trim());
                                        if(cubit.confirm(confirmpassword: passwwordconfri.text.trim(), password: passwword.text.trim())){
                                          Fluttertoast.showToast(
                                              msg: "Sucess",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor:buttoncolor,
                                              textColor: Colors.white,
                                              fontSize: 12.sp
                                          );
                                        }else{
                                          Fluttertoast.showToast(
                                              msg: "Email or Password is not found",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor:Colors.redAccent,
                                              textColor: Colors.white,
                                              fontSize: 12.sp
                                          );
                                        }
                                      }

                                    },
                                    Boxcolor: buttoncolor,
                                    width: 70.w,
                                    height: 5.h,
                                    child: Text(
                                      "SignUp",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  );
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Divider(
                                      color: buttoncolor,
                                      height: 2.sp,
                                    )),
                                    const Text(
                                      "Or",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Expanded(
                                        child: Divider(
                                      color: buttoncolor,
                                      height: 2.sp,
                                    )),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10.sp),
                                    child: OutlinedButton(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(
                                            padding: EdgeInsets.only(
                                                left: 10.sp, right: 10.sp),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50.sp)),
                                            side: BorderSide(
                                                color: Colors.green,
                                                width: 1.sp)),
                                        child: Row(
                                          children: const [
                                            CircleAvatar(
                                              backgroundColor: Colors.black,
                                              backgroundImage:
                                                  AssetImage("images/gamil.png"),
                                            ),
                                            Text(
                                              "Gmail",
                                              style:
                                                  TextStyle(color: Colors.white),
                                            ),
                                          ],
                                        )),
                                  ),
                                  OutlinedButton(
                                      onPressed: () {},
                                      style: OutlinedButton.styleFrom(
                                          padding: EdgeInsets.only(
                                              left: 10.sp, right: 10.sp),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50.sp)),
                                          side: BorderSide(
                                              color: Colors.blue, width: 1.sp)),
                                      child: Row(
                                        children: const [
                                          CircleAvatar(
                                            backgroundColor: Colors.black,
                                            backgroundImage:
                                                AssetImage("images/facebook.png"),
                                            radius: 12,
                                          ),
                                          Text(
                                            " FaceBook",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    passwword.dispose();
    passwwordconfri.dispose();
  }
}
