import 'package:day3/models/products_model.dart';
import 'package:dio/dio.dart';

class ApiProvider{
  final String baseUrl = "https://dummyjson.com";

  ProductsModel? productsModel;

  Future<ProductsModel?> getProducts() async{
    try {
      Response response = await Dio().get("$baseUrl/products");
      productsModel = ProductsModel.fromJson(response.data);
      return productsModel;
    } catch(e){
      print(e.toString());
    }
  }
}