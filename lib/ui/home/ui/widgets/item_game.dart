import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_pad/resources/colors.dart';
import 'package:game_pad/router/route_name.dart';
import 'package:game_pad/router/router.dart';
import 'dart:io' show Platform; //at the top
import 'package:glassmorphism/glassmorphism.dart';

import '../../../../common/button/rounded_button.dart';
import '../../../../model/data_model.dart';
import '../../bloc/game_data_bloc.dart';

class ItemGame extends StatefulWidget {
  final String title;
  final Image image;
  final String strImage;
  final String strItem;
  final Widget iconItem;

  const ItemGame(
      {Key? key,
      required this.title,
      required this.image,
      required this.strImage,
      required this.strItem,
      required this.iconItem})
      : super(key: key);

  @override
  State<ItemGame> createState() => _ItemGameState();
}

class _ItemGameState extends State<ItemGame> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.only(
                left: Platform.isIOS ? 54 : 0, right: 24, bottom: 8, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 7.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 70,
                  height: 24,
                  child: RoundedButton(
                    fontSize: 6.sp,
                    fontWeight: FontWeight.w600,
                    title: 'See All',
                    color: Colors.deepPurple,
                    onPressed: () {
                      Routes.instance
                          .navigateTo(routeName: RouteNames.categoryScreen);
                    },
                    fonFamily: 'Montserrat',
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: Platform.isIOS ? 54 : 0),
          constraints: const BoxConstraints(maxHeight: 134),
          child: BlocBuilder<GameDataBloc, GameDataState>(
            builder: (context, state) {
              if (state is GameDataInitialState) {
                context.read<GameDataBloc>().add(LoadGameDataEvent());
                return const CircularProgressIndicator();
              } else if (state is GameDataLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GameDataLoadedState) {
                return buildGameModel(state.apiResult);
              } else if (state is GameDataErrorState) {
                return const Center(
                  child: Text("Uh oh! 😭 Something went wrong!"),
                );
              }
              return const Text("Error");
            },
          ),
        ),
      ],
    );
  }
}

Widget buildGameModel(List<DataModel>? apiResult) {
  return ListView.builder(
    padding: EdgeInsets.zero,
    itemCount: apiResult!.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (BuildContext context, int index) {
      final DataModel dataModel = apiResult[index];
      return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4),
          child: InkWell(
            onTap: () {
              Routes.instance.navigateTo(routeName: RouteNames.homeItemDetail);
            },
            child: index == 0
                ? Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        width: 238,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(dataModel.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 68,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: <Color>[
                                AppColor.black1,
                                AppColor.black1.withOpacity(0.55),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, top: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dataModel.title,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(vertical: 12.0),
                    width: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(
                              dataModel.image,
                            ),
                            fit: BoxFit.cover)),
                  ),
          ));
    },
  );
}

class ItemGameCard extends StatelessWidget {
  const ItemGameCard({
    Key? key,
    required Image image,
  })  : _image = image,
        super(key: key);

  final Image _image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: 238,
        height: 134,
        child: _image,
      ),
    );
  }
}
