import 'package:get/get.dart';
import 'package:meditate/helpers/responsive.dart';
import 'package:meditate/screen/Alert_Popup.dart';
import 'package:meditate/screen/app_bar.dart';
import 'package:meditate/screen/barCode_SignPad.dart';
import 'package:meditate/screen/bottom_navigationBar.dart';
import 'package:meditate/screen/camera.dart';
import 'package:meditate/screen/Time_date.dart';
import 'package:meditate/screen/cartModel.dart';
import 'package:meditate/screen/design_container.dart';
import 'package:meditate/screen/e_mail.dart';
import 'package:meditate/screen/login_screen.dart';
import 'package:meditate/screen/PageView(link).dart';
import 'package:meditate/screen/PageView%20(LinkUpdate).dart';
import 'package:meditate/screen/provider_class.dart';
import 'package:meditate/screen/scroll.dart';
import 'package:meditate/screen/tabs_screen.dart';
import 'package:meditate/screen/welcome_screen.dart';
import 'package:meditate/screen/splash_screen.dart';
import 'package:meditate/screen/splash_screen2.dart';
import 'package:meditate/screen/splash_screen3.dart';
import 'package:meditate/screen/splash_screen4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<CartModel>(create: (context) => CartModel()),
        ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider())
      ],
      builder: (context, child) {
        return MyApp();
      }));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, ThemeProvider, child) {
      return ScreenUtilInit(
        // meditateSize: Responsive.isMobile(context)
        //     ? const Size(375, 812)
        //     : const Size(1101, 640),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Medidate',
          theme:
              ThemeProvider.isDarkTheme ?  ThemeData.light():ThemeData.dark() ,
          home:
              //MyApp(),
              //practice(),
              //alert(),
              SplashScreen2(),
          // Signature_barCode(),
          // ClipPathScreen(),
          //tabs_screen(),
          //ProfileScreen(),
          // e_mail(),
          //     value_pass(
          //      isDarkThemeApp: isDarkTheme,
          //      onThemeChanged: (value) {
          //     setState(() {
          //      isDarkTheme = value;
          //     });
          //   },
          // ),
          routes: {
            AppBarSc.routeName: (context) => AppBarSc(),
            SplashScreen.routeName: (context) => SplashScreen(),
            SplashScreen2.routeName: (context) => SplashScreen2(),
            SplashScreen3.routeName: (context) => SplashScreen3(),
            SplashScreen4.routeName: (context) => SplashScreen4(),
            WelcomeScreen.routeName: (context) => WelcomeScreen(),
            LoginScreen.routeName: (context) => LoginScreen(),
            bottombar.routeName: (context) => bottombar(),
            scrolSc.routeName: (context) => scrolSc(),
            ScrolLinked.routeName: (context) => ScrolLinked(),
            time_date.routeName: (context) => time_date(),
          },
        ),
      );
    });
  }
}
