import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_pad/common/blocs/loading/loading_cubit.dart';
import 'package:game_pad/common/blocs/loading/loading_state.dart';

class LoadingApp extends StatelessWidget {
  final Widget child;

   const LoadingApp({Key? key, required this.child}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        child,
        BlocBuilder<LoadingCubit, LoadingState>(
            bloc: context.read<LoadingCubit>(),
            builder: (context, state) {
              return Visibility(
                  visible: state.isLoading ?? false,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.black.withOpacity(0.3),
                    child: const Center(
                      child: SizedBox(
                        width: 72,
                        height: 72,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    ),
                  ));
            })
      ],
    );
  }
}
