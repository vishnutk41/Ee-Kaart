

class FavouriteProduct {
  final int? id;
  final String name;
  final String imageUrl;
  final String price;


  FavouriteProduct({this.id, required this.name, required this.imageUrl,required this.price});

  factory FavouriteProduct.fromMap(Map<String, dynamic> json) =>
      FavouriteProduct(
          id: json['id'], name: json['name'], imageUrl: json['imageUrl'], price: json['price']);

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'imageUrl': imageUrl,'price':price};
  }
}

//  "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL,website TEXT NOT NULL)",
