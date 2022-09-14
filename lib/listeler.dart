import 'dart:math';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Listeler extends StatelessWidget {
  Listeler({super.key});

  List<Kisiler> kisiler = List.generate(
      50,
      (index) => Kisiler(
          index + 1, (index + 1).toString(), Random().nextInt(50) + 18));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listeler"),
      ),
      body: Container(
        child: ListView(
          children: kisiler
              .map((e) => ListTile(
                  tileColor: renklendir(e.id),
                  title: Text(
                    "${e.ad}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                  ),
                  subtitle: Text(
                    "Yaş: ${e.yas}",
                    textAlign: TextAlign.end,
                  ),
                  leading: CircleAvatar(child: Text("${e.id}")),
                  onTap: () {
                    print(e.ad);
                  }))
              .toList(),
        ),
      ),
    );
  }
}

Color renklendir(int sira) {
  if (sira % 2 == 0)
    return Color.fromARGB(15, 0, 0, 0);
  else
    return Colors.white;
}

class Kisiler {
  int id;
  String ad;
  int yas;

  Kisiler(this.id, this.ad, this.yas);
}
