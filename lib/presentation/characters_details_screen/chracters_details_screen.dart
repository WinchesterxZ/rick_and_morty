import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/models/chracters_model.dart';

class ChractersDetailsScreen extends StatelessWidget {
  const ChractersDetailsScreen({super.key, required this.chractersModel});
  final ChractersModel chractersModel;

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: const Color(0xff262626),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          chractersModel.name,
          style: const TextStyle(
            color: Colors.white,
            shadows: [
              Shadow(
                offset: Offset(2.0, 2.0), // Adjust the offset for the shadow
                blurRadius: 3.0, // How soft the shadow looks
                color: Colors.black, // Black shadow color
              ),
            ],
          ),
        ),
        background: Hero(
            tag: chractersModel.id,
            child: Image.network(
              chractersModel.image,
              fit: BoxFit.fill,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        buildSliverAppBar(),
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: ListTile(
              leading: const Icon(
                Icons.contact_emergency,
                color: Color.fromARGB(255, 0, 116, 174),
                size: 35,
              ),
              title: Text(chractersModel.origin.name),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: ListTile(
                    leading: const Icon(
                      Icons.person_pin_rounded,
                      color: Colors.blue,
                      size: 35,
                    ),
                    title: Text(chractersModel.species)),
              ),
              Expanded(
                  flex: 1,
                  child: ListTile(
                    leading: const Icon(
                      Icons.hub,
                      color: Colors.cyan,
                      size: 35,
                    ),
                    title: Text(chractersModel.gender),
                  )),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: ListTile(
                  leading: const Icon(
                    Icons.location_on_rounded,
                    color: Colors.red,
                    size: 35,
                  ),
                  title: Text(chractersModel.location.name),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: ListTile(
                    leading: Icon(
                      Icons.circle,
                      color: chractersModel.status == 'Alive'
                          ? Colors.green
                          : Colors.red,
                      size: 35,
                    ),
                    title: Text(chractersModel.status),
                  )),
            ],
          ),
          const SizedBox(
            height: 500,
          ),
        ]))
      ],
    ));
  }
}
