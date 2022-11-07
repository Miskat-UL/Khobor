import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khobor/app/presentation/bloc/news_bloc.dart';
import 'package:khobor/app/presentation/ui/screens/details.dart';
import 'package:khobor/app/presentation/ui/screens/drawer_ewxp.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/connection/presentation/bloc/network_bloc.dart';
import '../../../../core/connection/presentation/bloc/network_state.dart';
import '../../bloc/news_event.dart';
import '../../bloc/news_state.dart';

class AllNewsScreen extends StatefulWidget {
  const AllNewsScreen({Key? key}) : super(key: key);

  @override
  State<AllNewsScreen> createState() => _AllNewsScreen();
}

class _AllNewsScreen extends State<AllNewsScreen> {
  NewsBloc _newsBloc = NewsBloc();
  String status = 'none';
  @override
  void initState() {
    super.initState();
    _newsBloc.add(GetAllNews());
  }

  bool isConnected = false;
  @override
  Widget build(BuildContext context) {
    BlocBuilder<NetworkBloc, NetworkState>(builder: (context, state) {
      if (state is NetworkFailure) {
        print("fbasfbasbfasbfasdbasdl");
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('net nai vai')));
        return const SizedBox.shrink();
      } else if (state is NetworkSuccess) {
        print("fbasfbasbfasbfasdbasdl");
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('net nai vai')));

        return const SizedBox.shrink();
      } else {
        print("fbasfbasbfasbfasdbasdl");
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('net nai vai')));
        return Text('dont know');
      }
    });
    return Scaffold(
      drawer: Drawer(
        width: 200,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                print('asfas');
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const MyHomePage(),
                  ),
                );
                // Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: BlocListener<NetworkBloc, NetworkState>(
        listener: (context, state) {
          if (state is NetworkFailure) {
            print('network faield');
            setState(() {
              isConnected = true;
            });

            // ScaffoldMessenger.of(context)
            //     .showSnackBar(const SnackBar(content: Text('net nai vai')));
          } else if (state is NetworkSuccess) {
            setState(() {
              isConnected = false;
            });
            initState();
          }
        },
        child: Stack(
          children: [
            Container(
              height: 1.sh,
              child: BlocProvider<NewsBloc>(
                create: (_) => _newsBloc,
                child: BlocBuilder<NewsBloc, NewsState>(
                  builder: (context, state) {
                    if (state is NewsLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is NewsError) {
                      return const Text('Error FEtching news');
                    } else if (state is NewsLoaded) {
                      return ListView.builder(
                          itemCount: state.news.articles!.length,
                          itemBuilder: (context, index) {
                            var data = state.news.articles![index];
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // print(data.url);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => Details(data.url)));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 250,
                                          width: 350,
                                          decoration: BoxDecoration(
                                              // border: const Border(
                                              //     bottom: BorderSide(
                                              //         width: 10,
                                              //         color: Colors.green)),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(24)),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    '${data.urlToImage}',
                                                  ),
                                                  fit: BoxFit.cover)),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            '${data.title}',
                                            style: const TextStyle(
                                                fontFamily: 'SansSerif',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    '${state.news.articles![index].source!.name}',
                                                    style: const TextStyle(
                                                      fontFamily: 'serif',
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Icon(Icons.notifications),
                                                    Icon(Icons
                                                        .local_activity_rounded),
                                                    Icon(
                                                        Icons.home_max_rounded),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                  thickness: 1,
                                ),
                              ],
                            );
                          });
                    } else {
                      return const SizedBox(
                        child: Center(
                          child: SizedBox(
                            width: 300,
                            child: LinearProgressIndicator(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 120,
              child: SizedBox(
                height: 30,
                child: Visibility(
                  visible: isConnected,
                  child: Container(
                    height: 20,
                    color: Colors.amber,
                    child: Text('This is now visible'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
