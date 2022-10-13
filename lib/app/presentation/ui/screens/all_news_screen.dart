import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khobor/app/presentation/bloc/news_bloc.dart';
import 'package:khobor/app/presentation/ui/screens/details.dart';

import '../../bloc/news_event.dart';
import '../../bloc/news_state.dart';

class AllNewsScreen extends StatefulWidget {
  const AllNewsScreen({Key? key}) : super(key: key);

  @override
  State<AllNewsScreen> createState() => _AllNewsScreen();
}

class _AllNewsScreen extends State<AllNewsScreen> {
  NewsBloc _newsBloc = NewsBloc();
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (timer) {
      _newsBloc.add(GetAllNews());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocProvider<NewsBloc>(
          create: (_) => _newsBloc,
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state is NewsLoading) {
                return CircularProgressIndicator();
              } else if (state is NewsError) {
                return Text('Error FEtching news');
              } else if (state is NewsLoaded) {
                return ListView.builder(
                    itemCount: state.news.articles!.length,
                    itemBuilder: (context, index) {
                      var data = state.news.articles![index];
                      return InkWell(
                        onTap: () {
                          print(data.url);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => Details(data.url)));
                        },
                        child: Container(
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
                                          '${data.urlToImage}',
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
                                  '${data.title}',
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
                                        Text(
                                          '${state.news.articles![index].source!.id}',
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
