import 'package:dio/dio.dart';
import 'package:eekart/routeManager.dart';
import 'package:eekart/view/cart_list_body.dart';
import 'package:eekart/view/demopage.dart';
import 'package:eekart/services/authentication/firebaseopt.dart';
import 'package:eekart/model/product.dart';
import 'package:eekart/view/productInfo.dart';
import 'package:eekart/model/productModel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Dio _dio = Dio();
  List<Product> products = [];
  FireBaseAuth fireBaseAuth = FireBaseAuth();
  RouteManager routeManager=RouteManager(); 
  
  @override
  void initState() {
    super.initState();
   fetchProducts();
  }

 Future<void> fetchProducts() async {
    try {
      final response = await _dio.get('https://fakestoreapi.com/products');

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;
        setState(() {
          // Convert each item to a Product and store in the products list
          products = responseData.map((item) {
            var product = Products.fromJson(item);
            return Product(
              name: product.title,
              price: '\$${product.price.toStringAsFixed(2)}', // Format price as a string
              image: product.image,
            );
          }).toList();
        });
      } else {
        print('Request failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('EeKart'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.orange[900]!,
          Colors.orange[800]!,
          Colors.orange[400]!
        ]
        )
            ),
          ),
          elevation: 0,
          actions:  [

              GestureDetector(
              onTap: () {
              fireBaseAuth.showLogoutDialog(context);
              },
              child: const Center(child: Text('Logout',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),)),
             ),
            IconButton(onPressed: () {
             Navigator.of(context).push(routeManager.createRoute(FavouriteListBody()));

            },
             icon: const Icon(Icons.shopping_cart_outlined,color: Colors.white,size: 30,)),


          ],
        ),
        body: SingleChildScrollView(
          child: GridView.builder(
                 shrinkWrap: true, // Add this to ensure the GridView respects the scrollable
                 physics: const NeverScrollableScrollPhysics(), // Add this to ensure it doesn't scroll independently
            padding: const EdgeInsets.all(16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 35,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () =>  

                 Navigator.of(context).push(routeManager.createRoute(ProductInfo(product: products[index]))),

                child: ProductItem(product: products[index]));
            },
          ),
        ),
      ),
    );
  }
}