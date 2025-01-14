import 'package:e_commerce/features/presentation/screens/tabs/categories/product/product_details/product_details_widgets/size_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../core/utils/color_app.dart';

class ProductSize extends StatefulWidget {
  final List<int> size;
  final void Function() onSelected;
  const ProductSize({super.key , required this.size , required this.onSelected});


  @override
  State<ProductSize> createState() => _ProductSizeState();
}
   final TextStyle getMediumStyle =  TextStyle(fontSize: 14 , color: AppColor.primary);

class _ProductSizeState extends State<ProductSize> {
  int selected = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Size',
            style: getMediumStyle
                .copyWith(fontSize: 18)
        ),
        const SizedBox(height: 8,),
        SizedBox(
          height: 45,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
              itemBuilder: (context , index){
              return GestureDetector(
                onTap: (){
                  setState(() {
                    selected = index;
                  });
                  widget.onSelected.call();
                },
                child: SizeWidget(
                  index: index,
                    selectedIndex: selected,
                    sizeNumber: widget.size[index]),
              );
              },
              separatorBuilder: (context , index)=> const SizedBox(width: 17,),
              itemCount: widget.size.length),
        ),
      ],
    );
  }
}
