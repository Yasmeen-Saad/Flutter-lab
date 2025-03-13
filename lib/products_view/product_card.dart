import 'package:day3/models/products_model.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  ProductWidget({super.key, required this.product});

  Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 45,
          backgroundColor: Colors.white10,
          backgroundImage: NetworkImage(product.thumbnail),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  product.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  product.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      product.category,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Text('\$${product.price}'.toString(), style: TextStyle(
                      fontSize: 17,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold
                  ),),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
