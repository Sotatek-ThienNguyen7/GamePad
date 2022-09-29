import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_pad/ui/help/ui/help_screen.dart';

import 'bloc/help_bloc.dart';

class HelpRoute {
  static Widget get route => BlocProvider(
    create: (context) => HelpBloc(),
    child:  const HelpScreen(),
  );
}