import 'package:flutter/material.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({
    this.height,
    this.width,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.photoURL,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final double? height;
  final double? width;
  final String title;
  final String subtitle;
  final String description;
  final String photoURL;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        height: height ?? 140,
        width: width ?? double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 116,
              width: 116,
              margin: const EdgeInsets.only(
                top: 12,
                bottom: 12,
                left: 12,
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                image: DecorationImage(
                  image: NetworkImage(photoURL),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 16, bottom: 16, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Clear Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Color(0xFF4A4A4A),
                      ),
                    ),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Clear Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: const Color(0xFF4A4A4A).withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Flexible(
                      child: Text(
                        description,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'Clear Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: const Color(0xFF4A4A4A).withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
