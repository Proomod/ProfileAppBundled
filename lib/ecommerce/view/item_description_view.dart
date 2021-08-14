import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pramodpro/ecommerce/Repository/ecommerce_repository.dart';

class ItemDescription extends StatelessWidget {
  const ItemDescription({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text('More info on ${item.name}')),
        body: Column(
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: item.imageUrl,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, dynamic error) => Icon(Icons.error),
              ),
            ),
            Text(
              item.name,
              style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text('Price: Rs.${item.price}',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            SingleChildScrollView(
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    item.description,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
