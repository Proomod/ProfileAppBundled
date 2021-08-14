part of 'ecommerce_bloc_bloc.dart';

class EcommerceState extends Equatable {
  const EcommerceState._(
      {this.isLoading = false,
      this.hasError = false,
      this.hasFinshedFetching = false,
      this.currentPageNo = 1,
      this.items = const <Item>[]});

  const EcommerceState.fetchedData(List<Item> items, int pageNo)
      : this._(items: items, currentPageNo: pageNo);
  const EcommerceState.errorState() : this._(hasError: true);
  const EcommerceState.loading() : this._(isLoading: true);
  const EcommerceState.finishedFetching(List<Item> items)
      : this._(hasFinshedFetching: true, items: items);

  final bool isLoading;
  final bool hasError;
  final bool hasFinshedFetching;
  final List<Item> items;
  final int currentPageNo;

  @override
  List<Object?> get props =>
      <dynamic>[isLoading, hasError, hasFinshedFetching, items, currentPageNo];
}
