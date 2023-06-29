part of 'data_bloc.dart';

abstract class DataState {}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataLoaded extends DataState {}

class DataError extends DataState {}

class DataEmpty extends DataState {}
