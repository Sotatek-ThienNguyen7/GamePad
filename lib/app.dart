import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:game_pad/common/blocs/alert/app_alert_cubit.dart';
import 'package:game_pad/common/blocs/alert/app_alert_state.dart';
import 'package:game_pad/common/blocs/loading/loading_cubit.dart';
import 'package:game_pad/common/loading_app.dart';
import 'package:game_pad/router/route_name.dart';
import 'package:game_pad/ui/home/bloc/game_data_bloc.dart';
import 'package:lifecycle/lifecycle.dart';
import 'package:game_pad/di/injections.dart';
import 'package:game_pad/resources/colors.dart';
import 'package:game_pad/router/router.dart';

class GPApp extends StatelessWidget {
  const GPApp({Key? key}) : super(key: key);

  List<BlocProvider> _providers() => [
        BlocProvider<LoadingCubit>(create: (_) => inject<LoadingCubit>()),
        BlocProvider<GameDataBloc>(create: (_) => inject<GameDataBloc>()),
        BlocProvider<AppAlertCubit>(create: (_) => inject<AppAlertCubit>())
      ];

  List<BlocListener> _blocListeners(BuildContext context) =>
      [BlocListener<AppAlertCubit, AppAlertState>(listener: _alertListeners)];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MultiBlocProvider(
        providers: _providers(),
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            color: AppColor.background,
            navigatorKey: Routes.instance.navigatorKey,
            debugShowCheckedModeBanner: false,
            title: "GSpecs",
            onGenerateRoute: Routes.generateRoute,
            initialRoute: RouteNames.splashScreen,
            navigatorObservers: [defaultLifecycleObserver],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: ThemeData(
                primaryColor: AppColor.primary, fontFamily: 'Montserrat'),
            builder: (context, widget) {
              return LoadingApp(
                  child: MultiBlocListener(
                listeners: _blocListeners(context),
                child: GestureDetector(
                  onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
                  child: widget,
                ),
              ));
            },
          ),
        ));
  }

  void _alertListeners(BuildContext context, AppAlertState state) {
    // TODO: Show alert.
  }
}
