import 'package:flutter/material.dart';

const cardsData = <Map<String, dynamic>>[
  {"elevation": 0.0, "label": "elevation 0"},
  {"elevation": 1.0, "label": "elevation 1"},
  {"elevation": 2.0, "label": "elevation 2"},
  {"elevation": 3.0, "label": "elevation 3"},
  {"elevation": 4.0, "label": "elevation 4"},
  {"elevation": 5.0, "label": "elevation 5"},
];

class CardsScreen extends StatelessWidget {
  static const String name = "Cards_screen";
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards Screen"),
      ),
      body: _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          ...cardsData.map(
            (card) => _CardsTypeOne(
                label: card["label"], elevation: card["elevation"]),
          ),
          ...cardsData.map(
            (card) => _CardsTypeTwo(
                label: card["label"], elevation: card["elevation"]),
          ),
          ...cardsData.map(
            (card) =>
                _CardsType3(label: card["label"], elevation: card["elevation"]),
          ),
          ...cardsData.map(
            (card) =>
                _CardsType4(label: card["label"], elevation: card["elevation"]),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

class _CardsTypeOne extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardsTypeOne({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert),
                )),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}

class _CardsTypeTwo extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardsTypeTwo({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: colors.outline,
          )),
      elevation: elevation,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert),
                )),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text("$label - outlone"),
            )
          ],
        ),
      ),
    );
  }
}

class _CardsType3 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardsType3({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      color: colors.surfaceContainerHighest,
      elevation: elevation,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert),
                )),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text("$label - filled"),
            )
          ],
        ),
      ),
    );
  }
}

class _CardsType4 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardsType4({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      child: Stack(
        children: [
          Image.network(
            "https://media.istockphoto.com/photos/portrait-of-a-photographer-picture-id455809281?b=1&k=6&m=455809281&s=170x170&h=zHjkrMXBkFgIt6uYQN7Wiu8E3l4-3bDtmOQNY9iMahY=",
            height: 350,
            fit: BoxFit.cover,
          ),
          Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(25))),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert),
                ),
              )),
        ],
      ),
    );
  }
}
