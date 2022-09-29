import 'package:equatable/equatable.dart';

class AppbarState extends Equatable {
  final bool? isConnected;
  final int? batteryLevel;

  const AppbarState({this.isConnected = false, this.batteryLevel = 0});

  AppbarState copyWith({bool? isConnected, int? batteryLevel}) {
    return AppbarState(
        isConnected: isConnected ?? this.isConnected,
        batteryLevel: batteryLevel ?? this.batteryLevel);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
