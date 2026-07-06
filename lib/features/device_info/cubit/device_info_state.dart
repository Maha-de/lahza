import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:lahza/features/device_info/models/response/repair_response.dart';

sealed class DeviceInfoState extends Equatable {
  const DeviceInfoState();

  @override
  List<Object?> get props => [];
}

final class DeviceInfoInitial extends DeviceInfoState {
  const DeviceInfoInitial();
}

final class DeviceInfoLoading extends DeviceInfoState {
  const DeviceInfoLoading();
}

final class DeviceImagePicked extends DeviceInfoState {
  final File image;

  const DeviceImagePicked(this.image);

  @override
  List<Object?> get props => [image];
}

final class DeviceInfoSuccess extends DeviceInfoState {
  final RepairResponse response;

  const DeviceInfoSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

final class DeviceInfoFailure extends DeviceInfoState {
  final String message;

  const DeviceInfoFailure(this.message);

  @override
  List<Object?> get props => [message];
}
