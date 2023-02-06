import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favouriteProvider.dart';

class Favorited extends StatefulWidget {
  const Favorited({Key? key}) : super(key: key);

  @override
  State<Favorited> createState() => _FavoritedState();
}

class _FavoritedState extends State<Favorited> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(context, listen: false);
    print('Hi');
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
              child: Consumer<FavouriteProvider>(
                  builder: (context, value, child) => ListView.builder(
                        itemCount: value.itemAdded.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              if (value.itemAdded.contains(index)) {
                                value.remove(index.toInt());
                              } else {
                                value.itemFavourite(index.toInt());
                              }
                            },
                            title: Text('Item $index'),
                            trailing: value.itemAdded.contains(index)
                                ? const Icon(Icons.favorite)
                                : const Icon(Icons.favorite_outline),
                          );
                        },
                      ))),
        ],
      ),
    );
  }
}
