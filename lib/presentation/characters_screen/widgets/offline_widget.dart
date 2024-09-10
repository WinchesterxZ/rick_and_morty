
import 'package:flutter/material.dart';

Widget buildOfflineWidget() {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      Image(
        image: AssetImage('assets/images/no_internet.png'),
        width: 100,
        height: 100,
      ),
      Text(
        'No Internet, Please Check Your Internet And Try Again. ',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
      )
    ],
  );
}
