import 'package:bloc_clean_code/bloc/switch_bloc.dart';
import 'package:bloc_clean_code/bloc/switch_event.dart';
import 'package:bloc_clean_code/bloc/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchScreen extends StatelessWidget {
  const SwitchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch Example"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Notifications",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
                  return Switch(
                      value: state.isSwitch,
                      onChanged: (newValue) {
                        context.read<SwitchBloc>().add(EnableAndDisable());
                      });
                })
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
              return Container(
                height: 100,
                color: Colors.red.withOpacity(state.slider),
              );
            }),
            SizedBox(
              height: 50,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
              return Slider(
                  value: state.slider,
                  onChanged: (value) {
                    context.read<SwitchBloc>().add(SliderEvent(slider: value));
                  });
            })
          ],
        ),
      ),
    );
  }
}
