import 'package:blog_minimal/screens/blog_desc.dart';
import 'package:blog_minimal/screens/signin.dart';
import 'package:blog_minimal/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        //designSize: const Size(360, 720),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, a) {
          return GetMaterialApp(
            theme: ThemeData(
              fontFamily: GoogleFonts.notoSerif().fontFamily,
            ),
            debugShowCheckedModeBanner: false,
            home: BlogDesc(),
          );
        });
  }
}
