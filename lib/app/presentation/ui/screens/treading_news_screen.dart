import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khobor/app/presentation/bloc/news_bloc.dart';

import '../../bloc/news_event.dart';
import '../../bloc/news_state.dart';

class TrendingNewsScreen extends StatefulWidget {
  const TrendingNewsScreen({Key? key}) : super(key: key);

  @override
  State<TrendingNewsScreen> createState() => _TrendingNewsScreen();
}

class _TrendingNewsScreen extends State<TrendingNewsScreen> {
  NewsBloc _newsBloc = NewsBloc();
  @override
  void initState() {
    super.initState();

    _newsBloc.add(GetAllTreadingNews());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocProvider<NewsBloc>(
          create: (_) => _newsBloc,
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state is TreadingNewsLoading) {
                return CircularProgressIndicator();
              } else if (state is NewsError) {
                return Text('Error FEtching news');
              } else if (state is TreadingNewsLoaded) {
                return ListView.builder(
                    itemCount: state.news.articles!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 350,
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              width: 350,
                              decoration: BoxDecoration(
                                  border: const Border(
                                      bottom: BorderSide(
                                          width: 10, color: Colors.green)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(24)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        '${state.news.articles![index].urlToImage}',
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                '${state.news.articles![index].title}',
                                style: TextStyle(
                                    fontFamily: 'SansSerif',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '${state.news.articles![index].source!.name}',
                                        style: TextStyle(
                                          fontFamily: 'serif',
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      // Text(
                                      //     '${state.news.articles![index].publishedAt}'),
                                      Text('Today'),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.notifications),
                                        Icon(Icons.local_activity_rounded),
                                        Icon(Icons.home_max_rounded),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    });
              } else {
                return Container(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
