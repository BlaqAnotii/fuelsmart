
// class Product {
//   String id;
//   String productImage;
//   String productCategory;
//   String productName;
//   String productDescription;
//   int quantity;
//   double amount;
//   String vendorId;

//   Product(
//       {required this.id,
//       required this.productImage,
//       required this.productCategory,
//       required this.productName,
//       required this.productDescription,
//       required this.quantity,
//       required this.amount,
//       required this.vendorId});

//   factory Product.fromJson(Map<String, dynamic> json) {
//     var product = Product(
//         id: json['id'] ?? '',
//         productImage: json['product_image'] ?? '',
//         productName: json['product_name'] ?? '',
//         productCategory: json['product_category'] ?? '',
//         productDescription: json['product_description'] ?? '',
//         quantity: json['quantity'] != null
//             ? int.parse(json['quantity'].toString())
//             : 0,
//         amount: json['amount'] != null
//             ? double.parse(json['amount'].toString())
//             : 0,

  

//     return product;
//   }
// }
