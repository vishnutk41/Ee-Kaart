// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:eekart/database_local/database_favourite.dart';
import 'package:flutter/material.dart';

import '../services/database/database_helper.dart';

class FavouriteListBody extends StatefulWidget {
  const FavouriteListBody({super.key});

  @override
  State<FavouriteListBody> createState() => _FavouriteListBodyState();
}

class _FavouriteListBodyState extends State<FavouriteListBody> {
  @override
  Widget build(BuildContext context) {
    // print("build");
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<FavouriteProduct>>(
            future: DataBaseHelper.instance.getcartProducts(),
            builder: (BuildContext context,
                AsyncSnapshot<List<FavouriteProduct>> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Text("Empty List"),
                );
              }
              {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) =>
                    Column(
                      children: [
                        Text(''),
                        Text('data')
                      ],
                    )
                        );
              }
            }),
      ),
    );
  }
}
