import 'package:flutter/material.dart';
import 'package:recipe_app/api/api_manager.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/screens/item.dart';
class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant,color: Colors.white,),
            SizedBox(width: 10,),
            Text("food recipes",style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.bold
            ),)
          ],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)
          )
        ),
      ),
      body: FutureBuilder(future: ApiManager.getRecipes(),
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            }
            else if(snapshot.hasError){
              return const Center(child: Text("something went wrong")) ;
            }
            else{
              var recipes=snapshot.data!;
              return ListView.builder(itemCount:recipes.length,
                  itemBuilder: (context, index) {
                    final recipe=recipes[index];
                    return Item(recipe: recipe) ;
                  },);
            }
          },),
    );
  }
}
