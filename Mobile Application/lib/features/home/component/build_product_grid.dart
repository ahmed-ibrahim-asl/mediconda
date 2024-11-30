import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediconda/core/managers/constant_manager.dart';
import 'package:mediconda/core/managers/extensions.dart';
import 'package:mediconda/core/navigation/routes.dart';

import '../../../core/managers/asset_manager.dart';
import '../../../core/managers/font_style_manager.dart';
import '../../../core/managers/size_manager.dart';
import '../models/medicine_model.dart';

class BuildProductGrid extends StatefulWidget{
   const BuildProductGrid({super.key});

  @override
  State<BuildProductGrid> createState() => _BuildProductGridState();
}

class _BuildProductGridState extends State<BuildProductGrid> {


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
       itemCount: results.isNotEmpty?results.length:medicines.length,
       itemBuilder: (context, index) {
         return buildProductCard(results.isNotEmpty?results[index]:medicines[index]);

       }
   );
  }
Widget buildProductCard(MedicineModel medicine) {
  final bool isLiked = wishlist.contains(medicine.id);
  return InkWell(
    onTap: (){
      context.addScreen(Routes.details);
    },
    child: Card(
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
                  DecorationImage(image: AssetImage(medicine.image,),fit: BoxFit.cover)
              ),
            ),
            const SizedBox(height: 8,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(medicine.name,
                    maxLines: 2,
                    style: FontStyleManager.getOverPassRegular(fontSize: FontSizeManager.s13.sp),),
                ),
                IconButton(
                  onPressed: () {
                    if(isLiked){
                      setState(() {
                        wishlist.remove(medicine.id);
                      });
                    }else{
                      setState(() {
                        wishlist.add(medicine.id);

                      });
                    }
                  },
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.blue : Colors.black,
                  ),
                ),

              ],
            ),
            const SizedBox(height: 4),
            Text(
              "${medicine.price} L.E",
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    ),
  );
}

}



