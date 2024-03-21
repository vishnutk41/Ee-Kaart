import 'package:eekart/model/product.dart';
import 'package:eekart/view/productBlock.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
        double width=MediaQuery.of(context).size.width;

    return 
    ProductBlock(imageUrl: product.image,productName: product.name,productPrice: product.price,width: width,);
  }
}

    // double width=MediaQuery.of(context).size.width;
    // double height=MediaQuery.of(context).size.height;