import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediconda/core/managers/constant_manager.dart';

import '../../../core/managers/asset_manager.dart';
import '../../../core/managers/font_style_manager.dart';
import '../../../core/managers/size_manager.dart';

class BuildProductGrid extends StatefulWidget{
   BuildProductGrid({super.key});

  @override
  State<BuildProductGrid> createState() => _BuildProductGridState();
}

class _BuildProductGridState extends State<BuildProductGrid> {
final List<MedicineModel> medicines = [
  MedicineModel(id: 0, name: 'Omron\nHEM-8712 BP', image: AssetsManager.elementItem, price: 150),
  MedicineModel(id: 1, name: 'Panadol\nHEM-8712 BP', image: AssetsManager.elementItem, price: 120),
];

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
       itemCount: medicines.length,
       itemBuilder: (context, index) {
         return buildProductCard(medicines[index]);

       }
   );
  }
Widget buildProductCard(MedicineModel medicine) {
  final bool isLiked = wishlist.contains(medicine.id);
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
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    ),
  );
}

}

class MedicineModel{
  final int id;
  final String name;
  final String image;
  final double price;
  MedicineModel({required this.id,required this.name,required this.image,required this.price});
}

