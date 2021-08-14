part of 'ecommerce_bloc_bloc.dart';

abstract class EcommerceBlocEvent extends Equatable {
  const EcommerceBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchData extends EcommerceBlocEvent {}
