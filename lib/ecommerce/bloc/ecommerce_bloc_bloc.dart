import 'package:bloc/bloc.dart';
import 'package:pramodpro/ecommerce/Repository/ecommerce_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'ecommerce_bloc_event.dart';
part 'ecommerce_bloc_state.dart';

class EcommerceBloc extends Bloc<EcommerceBlocEvent, EcommerceState> {
  EcommerceBloc() : super(const EcommerceState.loading());

  final EcommerceRepository ecommerceRepository = EcommerceRepository();

  @override
  Stream<Transition<EcommerceBlocEvent, EcommerceState>> transformEvents(
      Stream<EcommerceBlocEvent> events,
      TransitionFunction<EcommerceBlocEvent, EcommerceState> transitionFn) {
    return super.transformEvents(
      events.debounceTime(Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<EcommerceState> mapEventToState(
    EcommerceBlocEvent event,
  ) async* {
    if (!state.hasFinshedFetching && event is FetchData) {
      try {
        if (state.isLoading) {
          final List<Item> items = await ecommerceRepository.getItems();
          yield EcommerceState.fetchedData(items, 1);
          return;
        }
        if (state.items.isNotEmpty) {
          final int pageNo = state.currentPageNo + 1;
          final List<Item> items =
              await ecommerceRepository.getItems(pageNo: pageNo);
          if (items.isEmpty) {
            yield EcommerceState.finishedFetching(state.items);
          } else {
            yield EcommerceState.fetchedData(state.items + items, pageNo);
          }
        }
      } catch (e) {
        yield const EcommerceState.errorState();
      }
    }
  }
}
