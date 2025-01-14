import 'package:e_commerce/features/presentation/screens/tabs/categories/product/product_details/product_details_widgets/color_widget.dart';
import 'package:flutter/material.dart';

class ProductColor extends StatefulWidget {
  final List<Color> color;
  final void Function() onSelected;
  const ProductColor({super.key , required this.color , required this.onSelected});

  @override
  State<ProductColor> createState() => _ProductColorState();
}

class _ProductColorState extends State<ProductColor> {
  int selected = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                child: ColorItem(
                  color: widget.color[index],
                  index: index,
                  selectedIndex: selected,
                ),
              );
              },
              separatorBuilder: (context , index)=> const SizedBox(width: 17,),
              itemCount: widget.color.length),
        ),
      ],
    );
  }
}
