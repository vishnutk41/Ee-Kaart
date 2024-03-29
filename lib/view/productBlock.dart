import 'package:flutter/material.dart';
class ProductBlock extends StatelessWidget {
  const ProductBlock({
    super.key,
    required this.width,
    required this.imageUrl,
    required this.productName,
    required this.productPrice
  });

  final double width;
  final String imageUrl;
  final String productName;
  final String productPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
  // height: 500 ,
  // width: width * 0.5,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
    color: Colors.grey.withOpacity(0.5), // Color of the shadow
    spreadRadius: 5, // Spread radius
    blurRadius: 7, // Blur radius
    offset: const Offset(0, 3), // Offset position of the shadow
      ),
    ],
  ),

      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                    Flexible(
                      child:Image.network(imageUrl,fit: BoxFit.contain),
                    ),
                        Flexible(child:
                         Text(productName,
                         textAlign: TextAlign.center,
                         style: TextStyle(color: Colors.grey.shade600,fontSize: 15), 
                        overflow: TextOverflow.ellipsis,)),

                    FittedBox(
                      child: Column(
                        children: [
                          Text("${productPrice}",style: TextStyle(color: Colors.blue.shade600,fontWeight: FontWeight.bold,fontSize: 15),),
                        ],
                      ),
                    ),
              ],
            ),
          ),
          const Positioned(
            top: 0,
            bottom: 400,
            left: 130,
            right: 0,
            child: Center(
              child: IconButton(onPressed: null,
               icon: Icon(Icons.favorite_border,size: 25,)),
            ),
          )
        ],
      ),
            );
  }
}