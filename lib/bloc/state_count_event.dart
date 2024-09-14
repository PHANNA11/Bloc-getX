part of 'state_count_bloc.dart';

@immutable
sealed class StateCountEvent {}

class IncrementEvent extends StateCountEvent {}

class DecrementEvent extends StateCountEvent {}
