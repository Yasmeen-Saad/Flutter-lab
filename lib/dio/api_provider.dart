import 'package:day3/models/products_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider{
  final String baseUrl = "https://dummyjson.com";

  ProductsModel? productsModel;

  Future<ProductsModel?> getProducts() async{
    try {
      Response response = await Dio().get("$baseUrl/products", queryParameters: {
        "select" : "id,title,description,category,price,thumbnail"
      });
      productsModel = ProductsModel.fromJson(response.data);
      return productsModel;
    } catch(e){
      print(e.toString());
    }
  }

  userLoginEmail({required String email, required String password}) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try{
      FormData userData = FormData.fromMap({
        "username" : email,
        "password" : password
      });
      Response response = await Dio().post("$baseUrl/auth/login", data: userData);
      print(response.data['accessToken']);
      prefs.setString('token', response.data['accessToken']);
    }
    catch(e){
      print(e.toString());
      if(e is DioException){
        print(e.response?.data['message']);
        throw Exception(e.response?.data['message']);
      }
    }
  }
}