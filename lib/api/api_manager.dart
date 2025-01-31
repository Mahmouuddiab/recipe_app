import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipe_app/models/recipe_model.dart';
class ApiManager{
  static const String apiUrl="https://dummyjson.com/recipes";
  static Future<List<Recipe>?> getRecipes()async{
    var response= await http.get(Uri.parse(apiUrl));
    try{
      if(response.statusCode==200){
        var data=RecipeModel.fromJson(jsonDecode(response.body));
        return data.recipes ;
      }
      else{
        print("Error");
      }
    }catch(e){
      print(e.toString());
    }
    return null;
  }
}