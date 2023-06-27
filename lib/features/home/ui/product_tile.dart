import 'package:flutter/material.dart';
import 'package:my_app/features/home/bloc/home_bloc.dart';

import '../../../models/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final HomeBloc homeBloc;
  const ProductTile({super.key, required this.product, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
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
                    homeBloc
                        .add(HomeProductWishlistButtonClickedEvent(product));
                  },
                  icon: const Icon(Icons.favorite)),
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeCartButtonClickedEvent(product));
                  },
                  icon: const Icon(Icons.shopping_bag_outlined)),
            ],
          )
        ],
      ),
    );
  }
}
