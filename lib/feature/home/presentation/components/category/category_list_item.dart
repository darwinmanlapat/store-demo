import 'package:flutter/material.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    required this.isActive,
    required this.text,
    required this.onTap,
    required this.marginLeft,
    required this.marginRight,
    Key? key,
  }) : super(key: key);

  final bool isActive;
  final String text;
  final VoidCallback onTap;
  final double marginLeft;
  final double marginRight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: marginLeft, right: marginRight),
        width: 120,
        height: 48,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.centerLeft,
            end: const FractionalOffset(1.75, 0.5),
            colors: isActive
                ? [
                    const Color(0xFF36CFA2),
                    const Color(0xFF05B89D),
                  ]
                : [Colors.white, Colors.white],
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          border: Border.all(
            color: isActive ? Colors.transparent : const Color(0xFF05B89D),
          ),
        ),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'Clear Sans',
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: isActive ? Colors.white : const Color(0xFF05B89D),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
