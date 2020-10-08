import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_app/models/event.dart';

@immutable
abstract class EventListState extends Equatable {
  EventListState() : super();
}

class EventListEmpty extends EventListState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'EventListEmpty';
}

class EventListInProgress extends EventListState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'EventListInProgress';
}

class EventListInSuccess extends EventListState {
  final Stream<List<Event>> eventList;

  EventListInSuccess({@required this.eventList}) : assert(eventList != null);

  @override
  List<Object> get props => [this.eventList];

  @override
  String toString() => 'EventListInSuccess';
}

class EventListFailure extends EventListState {
  final Error error;

  EventListFailure({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [this.error];

  @override
  String toString() => 'EventListFailure';
}
