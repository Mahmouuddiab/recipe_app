import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/screens/details.dart';

class Item extends StatelessWidget {
Recipe recipe;
   Item({super.key,required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Details(recipe: recipe),));
        },
        child: Stack(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(image: NetworkImage(recipe.image),fit: BoxFit.fill)
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
                left: 0,
                child: Container(
                  height: 45,
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(recipe.name,style:const TextStyle(
                          color: Colors.white,fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),),
                        Spacer(),
                        Icon(Icons.star,color: Colors.orange,),
                        SizedBox(width: 5,),
                        Text(recipe.rating.toString(),style: TextStyle(
                          color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold
                        ),),
                        SizedBox(width: 15,),
                        Text(recipe.cookTimeMinutes.toString(),style: TextStyle(
                            color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold
                        ),),
                        SizedBox(width: 5,),
                        Text("min",style: TextStyle(
                            color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                  ),
                )
            )
        
          ],
        ),
      ),
    );
  }
}
