import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String tittle;
  final String caption;
  final String imageUrl;

  SlideInfo(
      {required this.tittle, required this.caption, required this.imageUrl});
}

final slides = <SlideInfo>[
  SlideInfo(
      tittle: "Busca La comida",
      caption:
          "Reprehenderit ipsum fugiat duis et quis officia et. Consequat ex aliquip et esse adipisicing sint cupidatat commodo nisi qui adipisicing. Deserunt anim consequat consectetur sit incididunt.",
      imageUrl: "assets/Images_tutorial/1.png"),
  SlideInfo(
      tittle: "Entrega Rapida",
      caption:
          "Irure eu cillum sit laborum eu exercitation ex nostrud irure eu duis adipisicing incididunt. Elit sint deserunt nisi cillum esse ea consectetur culpa est. Sunt nostrud velit eiusmod nulla est. Non laboris est do sunt dolor ad voluptate laboris qui. Nisi Lorem non tempor ea ex sunt excepteur ut reprehenderit et. Aliquip enim laborum sint nostrud cupidatat sunt nisi qui cupidatat. Eiusmod amet incididunt sint aliqua velit cupidatat pariatur cupidatat fugiat.",
      imageUrl: "assets/Images_tutorial/2.png"),
  SlideInfo(
      tittle: "Disfruta la comida",
      caption:
          "Sint ea consectetur aliqua ea. In officia adipisicing sit ea. Veniam aute ullamco elit nulla labore commodo. Ut ullamco id mollit eiusmod culpa in. Id nisi ut elit est ea incididunt adipisicing ullamco mollit ipsum quis ut.",
      imageUrl: "assets/Images_tutorial/3.png")
];

class AppTutotrialScreen extends StatefulWidget {
  static const name = "app_tutorial_screen";

  const AppTutotrialScreen({super.key});

  @override
  State<AppTutotrialScreen> createState() => _AppTutotrialScreenState();
}

class _AppTutotrialScreenState extends State<AppTutotrialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                    tittle: slideData.tittle,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl))
                .toList(),
          ),
          Positioned(
            bottom: 30,
            left: 275,
            child: OutlinedButton(
                onPressed: () => context.pop(), child: const Text("Skip")),
          ),
          endReached
              ? Positioned(
                  bottom: 31,
                  left: 8,
                  child: FadeInLeft(
                    delay: const Duration(milliseconds: 50),
                    from: 15,
                    child: FilledButton(
                        onPressed: () => context.pop(),
                        child: const Text("Comenzar")),
                  ))
              : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String tittle;
  final String caption;
  final String imageUrl;
  const _Slide(
      {required this.tittle, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final paragraphStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            SizedBox(
              height: 20,
            ),
            Text(
              tittle,
              style: titleStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              caption,
              style: paragraphStyle,
            ),
          ],
        ),
      ),
    );
  }
}
