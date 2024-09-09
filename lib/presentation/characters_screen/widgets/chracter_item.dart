import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/util/app_strings.dart';
import 'package:rick_and_morty/data/models/chracters_model.dart';

class ChracterItem extends StatelessWidget {
  final ChractersModel character;
  const ChracterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: character.id,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppStrings.chractersDetailsScreen,
              arguments: character);
        },
        child: Container(
            margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            padding: const EdgeInsetsDirectional.all(4),
            decoration: BoxDecoration(
              color: Color(0xff262626),
              borderRadius: BorderRadius.circular(8),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black
              //         .withOpacity(0.5), // Shadow color with some transparency
              //     spreadRadius: 1, // How far the shadow extends
              //     blurRadius: 8, // How soft the shadow looks
              //     offset: const Offset(0, 4), // Horizontal and vertical offsets
              //   ),
              // ],
            ),
            width: double.infinity,
            child: GridTile(
              footer: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                color: Colors.black54,
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: (character.status == 'Alive')
                          ? Colors.green
                          : Colors.red,
                      size: 10,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Text(
                        character.name,
                        style: const TextStyle(
                          height: 1.3,
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: character.image,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.fill)),
                ),
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Center(child: Image.asset('assets/images/rick.jpeg')),
              ),
            )),
      ),
    );
  }
}
