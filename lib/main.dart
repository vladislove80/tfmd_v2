import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tfmd_v2/app/app_router.dart';
import 'package:tfmd_v2/app/cubit/app_cubit.dart';
import 'package:tfmd_v2/app/cubit/app_state.dart';
import 'package:tfmd_v2/app/prefs/prefs.dart';
import 'package:tfmd_v2/flows/home_page/home_page.dart';
import 'package:tfmd_v2/flows/splash_page/splash_page.dart';
import 'package:get_it/get_it.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Application());
}

class Application extends StatelessWidget {
  final _router = AppRouter();
  final appCubit = AppCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: appCubit,
        child: BlocBuilder<AppCubit, AppState>(
          builder: (ctx, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.purple,
                primaryColor: Colors.white,
                fontFamily: 'Georgia',
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              localeResolutionCallback: (deviceLocale, supportedLocales) {
                var languageCode = deviceLocale?.languageCode;
                if (languageCode != null) {
                  final prefs = GetIt.instance.get<Prefs>();
                  prefs.setCountryCode(languageCode);
                }
              },
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
                Locale('en', 'GB'),
                Locale('ru', 'Ru'),
              ],
              onGenerateRoute: (settings) => _router.onGenerateRoute(settings),
              debugShowCheckedModeBanner: false,
              home: state is ShowPage && !state.isSplashPageShown
                  ? SplashPage()
                  : HomePage(),

            );
          },
        ));
  }
}
