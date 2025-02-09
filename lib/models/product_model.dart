// class Product {
//   final String image;
//   final String title;
//   final String location;
//   final String price;
//   final String likes;
//
//   Product({
//     required this.image,
//     required this.title,
//     required this.location,
//     required this.price,
//     required this.likes,
//   });
//
//   // JSON 데이터를 Model 객체로 변환하는 factory 생성자
//   factory Product.fromJson(Map<String, String> json) {
//     return Product(
//       image: json["image"] ?? "",
//       title: json["title"] ?? "정보 없음",
//       location: json["location"] ?? "정보 없음",
//       price: json["price"] ?? "0",
//       likes: json["likes"] ?? "0",
//     );
//   }
// }
