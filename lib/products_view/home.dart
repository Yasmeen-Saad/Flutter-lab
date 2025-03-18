import 'package:day3/dio/api_provider.dart';
import 'package:day3/models/products_model.dart';
import 'package:day3/products_view/product_card.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ProductsModel? productsModel;
  bool isLoading = true;

  Future<void> getProductsFromApiProvider() async {
    try {
      final result = await ApiProvider().getProducts();
      setState(() {
        productsModel = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error loading products: $e')));
    }
  }

  @override
  void initState() {
    super.initState();
    getProductsFromApiProvider();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe0e0e0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Products',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: isLoading
        ? Center(child: CircularProgressIndicator())
        : productsModel == null || productsModel!.products.isEmpty
        ? Center(child: Text('No products available'))
        : SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder:
                      (context, index) => Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ProductWidget(
                            product: productsModel!.products[index],
                          ),
                        ),
                      ),
                  separatorBuilder:
                      (context, index) => SizedBox(height: 15),
                  itemCount: productsModel?.products.length ?? 0,
                ),
              ],
            ),
          ),
        ),
    );
  }
}
