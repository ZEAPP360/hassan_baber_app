import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:barberapp/screens/BHSplashScreen.dart';
import 'package:barberapp/store/AppStore.dart';
import 'package:barberapp/utils/AppTheme.dart';
import 'package:barberapp/utils/BHDataProvider.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:nb_utils/nb_utils.dart';

import 'controllers/load_controller.dart';

AppStore appStore = AppStore();

void main() async {
  Get.put(LoginController());
  WidgetsFlutterBinding.ensureInitialized();

  await initialize(aLocaleLanguageList: languageList());

  appStore.toggleDarkMode(value: getBoolAsync('isDarkModeOnPref'));

  defaultRadius = 10;
  defaultToastGravityGlobal = ToastGravity.BOTTOM;

   initializeDateFormatting()
      .then((_) => runApp(
       GetMaterialApp(
       home: const MyApp()
       ) 
      ));

 
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '${'Hair Salon'}${!isMobile ? ' ${platformName()}' : ''}',
        home: BHSplashScreen(),
        theme: !appStore.isDarkModeOn ? AppThemeData.lightTheme : AppThemeData.darkTheme,
        navigatorKey: navigatorKey,
        scrollBehavior: SBehavior(),
        supportedLocales: LanguageDataModel.languageLocales(),
        localeResolutionCallback: (locale, supportedLocales) => locale,
      ),
    );
  }
}
