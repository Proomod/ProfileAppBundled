class Item {
  Item(this.id, this.price, this.imageUrl, this.name, this.description);
  final String id;
  final String price;
  final String imageUrl;
  final String name;
  final String description;

  static final RegExp htmlRemover = RegExp(r'<([^>]+)>');

  Item.fromJson(Map<String, dynamic> json)
      : id = json['_id'].toString(),
        price = json['max_sales_price'].toString(),
        imageUrl =
            'https://gyapu.com/${json['image'][0]['document']['path'].toString()}',
        name = json['name'].toString(),
        description = json['description']
            .toString()
            .replaceAll(htmlRemover, ' ')
            .replaceAll(r'/\s{2,}/g', ' ')
            .replaceAll('&nbsp;', '')
            .replaceAll('&#39;', '\'')
            .trim();
}
