import 'package:flutter/material.dart';

class Storecontainer extends StatefulWidget {
  String name = "";
  int price = 0;
  Color color = Colors.green;
  late Function(String,int) onPriceSelected;

  Storecontainer({
    Key? key,
    required this.name,
    required this.price,
    required this.color,
    required this.onPriceSelected,
  }) : super(key: key);
  
  @override
  State<Storecontainer> createState() => _Storecontainer();
}
class _Storecontainer extends State<Storecontainer> {
  @override
  Widget build(BuildContext context) {
return 
    InkWell(
      onTap: () {
        widget.onPriceSelected(widget.name, widget.price);
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(widget.name),
        ),
      ),
    );
  }
}
