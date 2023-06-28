import 'package:flutter/material.dart';
import 'package:my_app/features/home/bloc/home_bloc.dart';
import 'package:my_app/features/wishlist/ui/bloc/wishlist_bloc.dart';

import '../../../models/product.dart';

class WishlistTile extends StatelessWidget {
  final Product product;
  final WishlistBloc wishlistBloc;
  const WishlistTile(
      {super.key, required this.product, required this.wishlistBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.id,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Name: ${product.name}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Text('Description: ${product.des}'),
          const SizedBox(height: 8.0),
          Text('Price: \$${product.price.toStringAsFixed(2)}'),
          const SizedBox(height: 8.0),
          Image.network(product.imgUrl),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    wishlistBloc.add(WishlistRemoveItemEvent(product));
                  },
                  icon: const Icon(Icons.favorite)),
            ],
          )
        ],
      ),
    );
  }
}
