import 'package:http/http.dart' as http;
import 'dart:convert'; //
import '../models/ecommerce_model.dart';

class EcommerceRepository {
  Future<List<Item>> getItems({int pageNo = 1}) async {
    final List<Item> ecommerceItems = [];
    final String uri =
        'https://www.gyapu.com/api/product/productbycategory/G-Bar?page=$pageNo&totaldata=0&type=default&find_gt_amount=563659&find_lt_amount=50';
    print('page no is $pageNo');

    final http.Client client = http.Client();
    try {
      final url = Uri.parse(uri);
      final response = await client.get(
        url,
      );
      final dynamic res = json.decode(response.body) as Map<String, dynamic>;
      // ignore: avoid_dynamic_calls
      if (res['data'].length == 0) {
        return <Item>[];
      }

      res['data'].forEach((dynamic product) {
        final Item item = Item.fromJson(product as Map<String, dynamic>);
        ecommerceItems.add(item);
      });
    } catch (e) {
      throw Exception(e);
    } finally {
      client.close();
    }
    return ecommerceItems;
  }
}

// void main(List<String> args) {
//   EcommerceRepository ecommerce = EcommerceRepository();
//   ecommerce.getItems();
// }
