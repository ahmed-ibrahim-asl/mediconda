import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/managers/asset_manager.dart';
import '../../../core/managers/font_style_manager.dart';
import '../../../core/managers/size_manager.dart';

class BuildProductGrid extends StatelessWidget{
  const BuildProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
   return GridView.builder(
     padding: const EdgeInsets.symmetric(horizontal: 16),
       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: 2,
         childAspectRatio: 0.75,
         crossAxisSpacing: 16,
         mainAxisSpacing: 16,
         mainAxisExtent: 230
       ),
       itemCount: 4,
       itemBuilder: (context, index) {
         return buildProductCard(index == 1);

       }
   );
  }
  
}

Widget buildProductCard(bool isLiked) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(SizeManager.smallBorderRadius+8),
    ),
    elevation: 3,

    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 1.sw,
            height: 120.h,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeManager.smallBorderRadius),
              image:
                const DecorationImage(image: AssetImage(AssetManager.elementItem,),fit: BoxFit.cover)
            ),
          ),
          const SizedBox(height: 8,),
           Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Expanded(
                 child: Text("Omron HEM-8712 BP Monitor",
                           maxLines: 2,
                           style: FontStyleManager.getOverPassRegular(fontSize: FontSizeManager.s13.sp),),
               ),
               IconButton(
                 onPressed: () {},
                 icon: Icon(
                   isLiked ? Icons.favorite : Icons.favorite_border,
                   color: isLiked ? Colors.blue : Colors.black,
                 ),
               ),

             ],
           ),
          const SizedBox(height: 4),
          const Text(
            "Rs.150",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    ),
  );
}

