import 'package:bloc/bloc.dart';
import 'package:bloc_clean_code/bloc/switch/switch_event.dart';
import 'package:bloc_clean_code/bloc/switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState(isSwitch: false)) {
    on<EnableAndDisable>(_enableAnddisable);
    on<SliderEvent>(_slider);
  }

  void _enableAnddisable(EnableAndDisable event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _slider(SliderEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider: event.slider));
  }
}
