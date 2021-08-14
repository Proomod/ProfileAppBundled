import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pramodpro/ecommerce/bloc/ecommerce_bloc_bloc.dart';
import 'package:pramodpro/ecommerce/view/item_description_view.dart';

const kActiveButtonColor = Color(0xFFE32F66);

class Ecommerce extends StatefulWidget {
  const Ecommerce({Key? key}) : super(key: key);

  @override
  _EcommerceState createState() => _EcommerceState();
}

class _EcommerceState extends State<Ecommerce> {
  _EcommerceState() {
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent -
              _scrollController.position.pixels <=
          200.0) {
        print('something just happened');
        _ecommerceBloc.add(FetchData());
      }
    });
    _ecommerceBloc.add(FetchData());
  }
  final ScrollController _scrollController = ScrollController();
  final EcommerceBloc _ecommerceBloc = EcommerceBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Browse'),
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                EcommercePageButon(isActive: true, name: "All"),
                EcommercePageButon(name: 'Beer'),
                EcommercePageButon(name: 'Wiskey'),
                EcommercePageButon(name: 'Rum'),
                EcommercePageButon(name: 'Scotch'),
                EcommercePageButon(name: 'champange'),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<EcommerceBloc, EcommerceState>(
              bloc: _ecommerceBloc,
              builder: (BuildContext context, EcommerceState state) {
                return GridView.builder(
                  itemCount: state.items.isEmpty ? 10 : state.items.length,
                  controller: _scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    if (state.isLoading) {
                      return const Card(
                        color: Colors.white,
                        child: Center(
                            child: CircularProgressIndicator(
                                color: Colors.black54)),
                      );
                    }
                    return GestureDetector(
                      onTap: () {
                        // ignore: always_specify_types
                        Navigator.push<void>(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ItemDescription(item: state.items[index])));
                      },
                      child: Card(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Expanded(
                                child: CachedNetworkImage(
                                  imageUrl: state.items[index].imageUrl,
                                  memCacheHeight: 142,
                                  memCacheWidth: 118,
                                  errorWidget: (context, url, dynamic error) =>
                                      const Icon(Icons.error),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  state.items[index].name,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Price: Rs.${state.items[index].price}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class EcommercePageButon extends StatelessWidget {
  const EcommercePageButon({
    this.isActive = false,
    required this.name,
    Key? key,
  }) : super(key: key);

  final String name;

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          shadowColor: Colors.white,
          backgroundColor: isActive ? kActiveButtonColor : Colors.white12,
          minimumSize: const Size(110, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: const BorderSide(
              width: 4,
              color: Colors.red,
            ),
          ),
        ),
        onPressed: () {},
        child: Text(name),
      ),
    );
  }
}
