class CourseModel {
  CourseModel(
      {required this.title,
      required this.instructor,
      this.route = '',
      this.price = '\$9.99',
      required this.imageUrl,
      required this.summary});
  CourseModel.fromJson(Map<String, dynamic> json)
      : title = json['title'].toString(),
        instructor = json['instrucor'].toString(),
        price = json['price'] == null ? '\$9.99' : json['price'].toString(),
        imageUrl = json['imageUrl'].toString(),
        route = json['route'].toString(),
        summary = <String>[...json['summary']];
  final String title;
  final String instructor;
  final String price;
  final String imageUrl;
  final List<String> summary;
  final String route;
}
