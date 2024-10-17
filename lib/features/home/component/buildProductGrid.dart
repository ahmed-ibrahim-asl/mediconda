import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Buildproductgrid extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return GridView.builder(
     padding: EdgeInsets.symmetric(horizontal: 16),
       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: 2,
         childAspectRatio: 0.75,
         crossAxisSpacing: 16,
         mainAxisSpacing: 16,
       ),
       itemCount: 4,
       itemBuilder: (context, index) {
         return BuildProductCard(index == 1);

       }
   );
  }
  
}

Widget BuildProductCard(bool isLiked) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
    ),
    elevation: 3,
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(child: Center(
            child: Image.asset('element_item.png',fit: BoxFit.cover,),
          ),),
          SizedBox(height: 8,),
          Text("Omron HEM-8712 BP Monitor",
          style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 4),
          Text(
            "Rs.150",
            style: TextStyle(color: Colors.black),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? Colors.blue : Colors.black,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

