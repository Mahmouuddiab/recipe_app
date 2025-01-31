import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_model.dart';

class Details extends StatelessWidget {
  Recipe recipe;
   Details({super.key,required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.network(recipe.image,height: 450,fit: BoxFit.cover,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Positioned(
                  top: 0,left: 0,
                    child: IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back,color: Colors.black,size: 30,)
                    )
                ),
              ),
              Positioned(
                left: 30,right: 30,bottom: -50,
                child: Container(
                  height: 140,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.black12,spreadRadius: 2,blurRadius: 2)],
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 5,left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(recipe.name,style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20
                            ),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(recipe.mealType[0],style: TextStyle(
                                    color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20
                                ),),
                                SizedBox(width: 5,),
                                Text("&",style: TextStyle(
                                    color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20
                                ),),
                                SizedBox(width: 5,),
                                Text(recipe.cuisine,style: TextStyle(
                                    color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20
                                ),),

                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15)
                          )
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star,color: Colors.orange,),
                            Text(recipe.rating.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                            SizedBox(width: 50,),
                            Icon(Icons.timer,color: Colors.blue,),
                            Text(recipe.cookTimeMinutes.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                            SizedBox(width: 50,),
                            Icon(Icons.accessibility,color: Colors.black,),
                            SizedBox(width: 5,),
                            Text("${recipe.caloriesPerServing.toString()} kcl",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50,),
                Text("ingredients",style: TextStyle(
                  fontSize: 22,fontWeight: FontWeight.bold,
                  color: Colors.black
                ),),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children:
                   List.generate(recipe.ingredients.length, (index) {
                     return Text(recipe.ingredients[index],style: TextStyle(
                       fontSize: 20,fontWeight: FontWeight.w400
                     ),) ;

                   },)

               )
              ],
            ),
          )
        ],
      ),
    );
  }
}
