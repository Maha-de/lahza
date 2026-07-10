import 'package:flutter/material.dart';
import 'package:lahza/core/network/error_model.dart';
import 'package:lahza/features/profile/models/profile_model.dart';



@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final ProfileModel profileModel;
  ProfileSuccess({required this.profileModel });
}

class ProfileError extends ProfileState {
  final ErrorModel errorModel;
  ProfileError({required this.errorModel});
}

