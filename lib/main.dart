import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tfmd_v2/app/app_router.dart';
import 'package:tfmd_v2/app/cubit/app_cubit.dart';
import 'package:tfmd_v2/app/cubit/app_state.dart';
import 'package:tfmd_v2/flows/home_page/home_page.dart';
import 'package:tfmd_v2/flows/splash_page/splash_page.dart';

Future<void> main() async {
  runApp(Application());
}

class Application extends StatelessWidget {
  final _router = AppRouter();
  final appCubit = AppCubit();

  @override
  Widget build(BuildContext context) {
    Locale? myLocale;
    return BlocProvider.value(
        value: appCubit,
        child: BlocBuilder<AppCubit, AppState>(
          builder: (ctx, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              localeResolutionCallback: (deviceLocale, supportedLocales) {
                myLocale = deviceLocale;
                print(myLocale?.countryCode);
                print(myLocale?.languageCode);
              },
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
                Locale('en', ''),
                Locale('ru', ''),
              ],
              onGenerateRoute: (settings) => _router.onGenerateRoute(settings),
              debugShowCheckedModeBanner: false,
              home: state is ShowPage && state.showSplashScreen
                  ? SplashPage()
                  : HomePage(),
            );
          },
        ));
  }
}
