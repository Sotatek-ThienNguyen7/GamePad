import 'package:equatable/equatable.dart';

class AppAlertState extends Equatable {

  final String? title;
  final String? messages;

  const AppAlertState({this.title, this.messages});

  AppAlertState copyWith({String? title, String? messages}) {
    return AppAlertState(title: title ?? this.title, messages: messages ?? this.messages);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];

}