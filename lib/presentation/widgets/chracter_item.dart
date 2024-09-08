import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/views/chracters_details_screen.dart';
import 'package:rick_and_morty/presentation/widgets/textfor_chracteritem_widget.dart';

class ChracterItem extends StatelessWidget {
  const ChracterItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ChractersDetailsScreen()));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(0.5), // Shadow color with some transparency
              spreadRadius: 1, // How far the shadow extends
              blurRadius: 8, // How soft the shadow looks
              offset: const Offset(0, 4), // Horizontal and vertical offsets
            ),
          ],
        ),
        height: 175,
        width: 175,
        child: Column(
          children: [
            // Image Container
            Expanded(
              flex: 2, // 2:1 ratio with the text below
              child: CachedNetworkImage(
                imageUrl:
                    'https://rickandmortyapi.com/api/character/avatar/2.jpeg',
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.fill)),
                ),
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Center(child: Image.asset('assets/images/rick.jpeg')),
              ),
            ),
            const Expanded(
              flex: 1,
              child: Column(
                children: [
                  TextForChracterItemWidget(
                    name: 'Morty Smith',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    icon: Icons.male,
                    iconColor: Colors.blue,
                  ),
                  TextForChracterItemWidget(
                    name: 'Human | Alive ',
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    icon: Icons.circle,
                    iconColor: Color.fromARGB(196, 116, 217, 0),
                    iconSize: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
