import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/favourite_app/favouriteProvider.dart';

import 'inFavorite.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  // List<int> itemAdded = [];
  @override
  Widget build(BuildContext context) {
    // final favorite = Provider.of<FavouriteProvider>(context);
    print('hi');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App'),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Favorited()));
              },
              child: const Icon(Icons.favorite)),
          const SizedBox(width: 25)
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return Consumer<FavouriteProvider>(
                builder: (context, value, child) => ListTile(
                  onTap: () {
                    if (value.itemAdded.contains(index)) {
                      value.remove(index);
                    } else {
                      value.itemFavourite(index);
                    }
                  },
                  title: Text('Item $index'),
                  trailing: value.itemAdded.contains(index)
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_outline),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
