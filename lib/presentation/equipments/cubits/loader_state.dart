part of 'loader_cubit.dart';

abstract class LoaderState  {
  const LoaderState();
}

class LoaderInitial extends LoaderState {}

class Show extends LoaderState {}

class Hide extends LoaderState {}
