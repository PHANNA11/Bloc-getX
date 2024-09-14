// ignore_for_file: must_be_immutable

part of 'state_count_bloc.dart';

class StateCountState {
  StateCountState({required this.number});
  int? number;
}

final class StateCountInitial extends StateCountState {
  StateCountInitial() : super(number: 0);
}
