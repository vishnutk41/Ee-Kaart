import 'package:flutter/material.dart';
import 'package:eekart/model/product.dart'; 
import 'package:eekart/services/database/database_helper.dart';
import 'package:eekart/database_local/database_favourite.dart';

class ProductInfo extends StatefulWidget {
  final Product product;

  ProductInfo({required this.product});

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  late DataBaseHelper db;

  @override
  void initState() {
    super.initState();
    db = DataBaseHelper.instance;
  }

  Future<void> addToCart() async {
    FavouriteProduct favouriteProduct = FavouriteProduct(
      name: widget.product.name,
      imageUrl: widget.product.image,
      price: widget.product.price.toString(),
    );
    await db.add(favouriteProduct);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Added to cart!'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Image.network(
                    widget.product.image,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  widget.product.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 25),
                  overflow: TextOverflow.clip,
                ),
                Text(
                  "${widget.product.price}",
                  style: TextStyle(
                      color: Colors.blue.shade600,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                SizedBox(  
                  height: 50,
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () => addToCart(),
                        child: Container(
                          height: 50,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'ADD TO CART',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: width * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'BUY NOW',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
