import 'package:equatable/equatable.dart';

class OnBoardingState extends Equatable {
  final int? page;
  const OnBoardingState({this.page = 0});

  OnBoardingState copyWith({int? page}) {
      return OnBoardingState(page: page ?? this.page);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [page];
}