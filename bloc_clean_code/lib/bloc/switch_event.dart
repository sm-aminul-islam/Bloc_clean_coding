import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();
  @override
  List<Object> get props => [];
}

class EnableAndDisable extends SwitchEvent {}

class SliderEvent extends SwitchEvent {
  double slider;
  SliderEvent({required this.slider});
  @override
  List<Object> get props => [slider];
}
