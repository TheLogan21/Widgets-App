import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = "infinite_scroll_screen";

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(
      () {
        if ((scrollController.position.pixels + 500) >=
            scrollController.position.maxScrollExtent) {
          loadNextPage();
        }
      },
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void moveScrollToTop() {
    if (scrollController.position.pixels <=
        scrollController.position.minScrollExtent) {
      return;
    }
    scrollController.animateTo(scrollController.position.minScrollExtent,
        duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  void moveScrollTobottom() {
    if (scrollController.position.pixels + 150 <=
        scrollController.position.maxScrollExtent) {
      return;
    }
    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    if (!isMounted) {
      return;
    }
    isLoading = false;
    final lastId = imagesIds.last;

    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();

    setState(() {});
    moveScrollToTop();
  }

  Future loadNextPage() async {
    if (isLoading) return;

    isLoading = true;
    setState(() {}); // Asegura que el UI refleje el estado de carga

    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();

    if (!mounted) {
      return; // Verifica si el widget sigue montado antes de hacer setState()
    }

    isLoading = false;
    setState(() {});
    moveScrollTobottom();
  }

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll(
      [1, 2, 3, 4, 5].map((e) => lastId + e),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                  placeholder: const AssetImage(
                      "assets/Images_tutorial/jar-loading.gif"),
                  image: NetworkImage(
                      "https://picsum.photos/id/${imagesIds[index]}/500/300"));
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading
            ? CircularProgressIndicator()
            : FadeIn(child: Icon(Icons.arrow_back_ios_new_outlined)),
      ),
    );
  }
}
