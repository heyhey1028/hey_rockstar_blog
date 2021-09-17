import 'package:flutter/material.dart';
import 'package:hey_rockstar_blog/screens/article_list_screen.dart';
import 'package:hey_rockstar_blog/screens/article_screen.dart';
import 'package:hey_rockstar_blog/screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hey_rockstar_blog/services/page_service.dart';
import 'package:hey_rockstar_blog/widgets/category_bar.dart';

final pageProvider = StateNotifierProvider.autoDispose<PageService, PageState>(
  (ref) => PageService(PageState(0)),
);
void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final pageService = watch(pageProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CategoryBar(
          onTap: (int value) =>
              context.read(pageProvider.notifier).changePageTo(value),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: double.infinity,
                height: 500,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.2), BlendMode.darken),
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'images/IMGP0983.jpg',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 32,
                      right: 160,
                      child: Text(
                        'WELCOME TO MY BLOG\n'
                        '\n A FATHER,'
                        '\n APP DEVELOPER,'
                        '\n AND FOOD ENTHUSIAST,'
                        '\n LIVING IN TOKYO',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    )
                  ],
                )),
            MainPageBody(page: pageService.pageNum),
          ],
        ),
      ),
    );
  }
}

class MainPageBody extends StatelessWidget {
  const MainPageBody({Key key, this.page}) : super(key: key);
  final int page;

  @override
  Widget build(BuildContext context) {
    switch (page) {
      case 0:
        return HomeScreen();
      case 1:
        return ArticleListScreen();
      case 2:
        return ArticleScreen();
      default:
        return HomeScreen();
    }
  }
}
