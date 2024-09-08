import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ChractersDetailsScreen extends StatelessWidget {
  const ChractersDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Column(
          children: [
            Expanded(
              flex: 3,
              child: CachedNetworkImage(
                imageUrl:
                    'https://rickandmortyapi.com/api/character/avatar/2.jpeg',
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
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
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.contact_emergency,
                      color: const Color.fromARGB(255, 0, 116, 174),
                      size: 35,
                    ),
                    title: Text('Morty Smith'),
                    subtitle: Text('Earth (Replacement Dimension)'),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ListTile(
                            leading: Icon(
                              Icons.person_pin_rounded,
                              color: Colors.blue,
                              size: 35,
                            ),
                            title: Text('Human')),
                      ),
                      Expanded(
                          flex: 1,
                          child: ListTile(
                            leading: Icon(
                              Icons.hub,
                              color: Colors.cyan,
                              size: 35,
                            ),
                            title: Text('Male'),
                          )),
                    ],
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.location_on_rounded,
                      color: Colors.red,
                      size: 35,
                    ),
                    title: Text('Citadel of Ricks'),
                  )
                ],
              ),
            )
          ],
        ),
        Positioned(
            top: 30, // Position from the top
            left: 10, // Position from the left
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white, // Ensure it is visible over the image
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),)
        ] 
        
      ),
    );
  }
}
