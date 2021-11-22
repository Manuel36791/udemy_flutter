import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:udemy_flutter/layout/news_app/news_cubit/news_cubit.dart';
import 'package:udemy_flutter/layout/news_app/news_layout.dart';
import 'package:udemy_flutter/layout/shop_app/shop_cubit/cubit.dart';
import 'package:udemy_flutter/layout/shop_app/shop_layout.dart';
import 'package:udemy_flutter/layout/social_app/social_layout.dart';
import 'package:udemy_flutter/models/social_app/cubit/cubit.dart';
import 'package:udemy_flutter/modules/native_code.dart';
import 'package:udemy_flutter/modules/social_app/social_login_screen/social_login_screen.dart';
import 'package:udemy_flutter/shared/bloc_observer.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/cubit/states.dart';
import 'package:udemy_flutter/shared/cubit/todo_cubit.dart';
import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';
import 'package:udemy_flutter/shared/network/local/cache_helper.dart';
import 'package:udemy_flutter/shared/styles/themes.dart';

//import 'package:udemy_flutter/modules/bmi/bmi_screen.dart';
//import 'package:udemy_flutter/modules/login/login_screen.dart';
// import 'package:udemy_flutter/home_screen.dart';
// import 'package:udemy_flutter/messenger_screen.dart';
// import 'package:udemy_flutter/users_screen.dart';
//import 'package:udemy_flutter/layout/home_layout.dart';
//import 'package:udemy_flutter/layout/todo_app/todo_layout.dart';
//import 'package:udemy_flutter/modules/counter/counter_screen.dart';

/*Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('on background message');
  print(message.data.toString());

  showToast(
    text: 'on background message',
    state: ToastStates.SUCCES,
  );
}*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /*await Firebase.initializeApp();
  var token = await FirebaseMessaging.instance.getToken();

  print(token);

  // foreground fcm
  FirebaseMessaging.onMessage.listen((event) {
    print('on message');
    print(event.data.toString());

    showToast(
      text: 'on message',
      state: ToastStates.SUCCES,
    );
  });

  // when click on notification to open app
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print('on message opened app');
    print(event.data.toString());

    showToast(
      text: 'on message opened app',
      state: ToastStates.SUCCES,
    );
  });

  // background fcm
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);*/

  /// set minimum width and height on app
  if (Platform.isWindows)
    await DesktopWindow.setMinWindowSize(
      Size(
        325.0,
        650.0,
      ),
    );

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getData(key: 'isDark');

  Widget widget;

  // bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  // token = CacheHelper.getData(key: 'token');

  uId = CacheHelper.getData(key: 'uId');
  print(uId);
  // if (onBoarding != null) {
  //   if (token != null)
  //     widget = ShopLayout();
  //   else
  //     widget = ShopLoginScreen();
  // } else {
  //   widget = OnBoardingScreen();
  // }

  if (uId != null) {
    widget = SocialLayout();
  } else {
    widget = SocialLoginScreen();
  }

  // print(onBoarding);

  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget? startWidget;

  MyApp({
    this.isDark,
    this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getScience()
            ..getSports(),
        ),
        BlocProvider(
          create: (BuildContext context) => AppCubit()
            ..changeAppMode(
              fromShared: isDark,
            ),
        ),
        BlocProvider(
          create: (BuildContext context) => ShopCubit()
            ..getHomeData()
            ..getCategories()
            ..getFavorites()
            ..getUserData(),
        ),
        BlocProvider(
          create: (BuildContext context) => SocialCubit()
            ..getUserData()
            ..getPosts(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            // themeMode:
            //     AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            themeMode: ThemeMode.light,
            home: ShopLayout(),
          );
        },
      ),
    );
  }
}
